import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/steps/qr_step_pure.dart';
import 'package:time_trackify/pages/qr_scanner/steps/qr_step_scan.dart';
import 'package:time_trackify/pages/qr_scanner/steps/qr_step_summary.dart';
import 'package:time_trackify/widgets/loading_indicator.dart';

@RoutePage()
class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrBloc, QrState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }

        if (state.currentQrStep == QrStep.scan) {
          return const QrStepScan();
        }

        if (state.currentQrStep == QrStep.summary) {
          return const QrStepSummary();
        }

        return const QrStepPure();
      },
    );
  }
}
