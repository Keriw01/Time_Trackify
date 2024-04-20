import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackify/base_cubit.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/work_logs.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/services/firestore_service.dart';

part 'statistics_state.dart';
part 'statistics_bloc.g.dart';

class StatisticsBloc extends BaseCubit<StatisticsState> {
  late final FirestoreService firestoreService = FirestoreService();

  StatisticsBloc(AppRouter appRouter, BuildContext context)
      : super(
          appRouter,
          StatisticsState(),
        );

  Future<void> getStatisticsData() async {
    try {
      emit(state.copyWith(isLoading: true));

      User? user = FirebaseAuth.instance.currentUser;

      WorkLogs workLogs = await firestoreService.getWorkLogs(user?.uid);

      Map<int, int> hoursPerMonth = {};

      workLogs.workLogs?.forEach((workLog) {
        // Sprawdzenie, czy istnieje startWork i endWork
        if (workLog.startWork != null && workLog.endWork != null) {
          // Obliczenie różnicy czasu między startWork.time a endWork.time
          Duration duration =
              workLog.endWork!.time.difference(workLog.startWork!.time);
          // Obliczenie sumy godzin pracy dla odpowiedniego miesiąca
          int month = workLog.startWork!.time.month;
          int hoursWorked = duration.inHours;
          hoursPerMonth.update(month, (value) => value + hoursWorked,
              ifAbsent: () => hoursWorked);
        }
      });

      List<Map<String, dynamic>> formattedData =
          hoursPerMonth.entries.map((entry) {
        return {
          'month': entry.key - 1,
          'hours': entry.value.toDouble(),
        };
      }).toList();

      emit(state.copyWith(
        isLoading: false,
        workLogs: workLogs,
        chartData: formattedData,
      ));
    } on DocumentIdNotExist {
      emit(state.copyWith(
        errorMessage: 'Dokument o takim id nie istnieje',
        isLoading: false,
      ));
    } on FirestoreException {
      emit(state.copyWith(
        errorMessage: 'Błąd z cloud firestore',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Wystąpił błąd podczas pobierania danych o użytkowniku',
        isLoading: false,
      ));
    }
  }

  void clearStatisticsBlocState() {
    emit(StatisticsState());
  }
}
