import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/qr_codes.dart';
import 'package:time_trackify/models/user_data.dart';
import 'package:time_trackify/models/work_event.dart';
import 'package:time_trackify/models/work_log.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUser(
    String userId, {
    String role = 'worker',
    String status = 'absent',
    String userName = 'not set',
  }) async {
    try {
      await _firestore.collection('Users').doc(userId).update({
        'role': role,
        'status': status,
        'userName': userName,
      });
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<UserData> getUser(String? userId) async {
    /// TODO Błąd w przypadku rejestracji użytkownika ponieważ listener w auth_flow_screen przenosi na Qr_page gdzie tworzy qr_bloc próbując uzyskać dane użytkownika z userId który nie zdążył zostać utworzony przez metodę updtateUser w register.
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Users').doc(userId).get();

      Map<String, dynamic>? data = snapshot.data();

      if (data != null) {
        return UserData.fromJson(data);
      } else {
        throw DocumentIdNotExist();
      }
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<List<QrCodes>> getQrCodes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('QrCodes').get();

      List<QrCodes> qrCodesList = snapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> doc) =>
              QrCodes.fromJson(doc.data()!))
          .toList();

      return qrCodesList;
    } catch (e) {
      throw FirestoreException();
    }
  }

  Future<void> addToWorkLogs(
    String userId,
    DateTime currentTime,
    String scannedQrCode,
  ) async {
    try {
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('WorkLogs').doc(userId);

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await userDocRef.get() as DocumentSnapshot<Map<String, dynamic>>;

      if (snapshot.exists) {
        List<dynamic> logs = snapshot.data()!['Logs'];

        List<WorkLog> workLogs = logs.map((log) {
          return WorkLog.fromJson(log);
        }).toList();

        if (scannedQrCode.startsWith("E")) {
          if (workLogs.last.endWork != null) {
            logs.add({
              'breaks': [],
              'endWork': null,
              'startWork': WorkEvent(
                qrCode: scannedQrCode,
                time: currentTime,
              ).toJson(),
            });

            await userDocRef.update({
              'Logs': logs,
            });
          } else {
            throw NotFinishedWork();
          }
        } else if (scannedQrCode.startsWith("L")) {
          if (workLogs.last.endWork == null) {
            Map<String, dynamic> lastLog = logs.last;

            lastLog['endWork'] = WorkEvent(
              qrCode: scannedQrCode,
              time: currentTime,
            ).toJson();

            logs[logs.length - 1] = lastLog;

            await userDocRef.update({
              'Logs': logs,
            });
          }
        } else if (scannedQrCode.startsWith("B")) {
          // jeżeli pusta/brak listy breaks dodajemy listę z wpisem o starcie czasu przerwy pierwszej
          if (workLogs.last.breaks == null || workLogs.last.breaks!.isEmpty) {
            Map<String, dynamic> lastLog = logs.last;

            List<Map<String, dynamic>> breaksList = [
              {
                'startTime': currentTime.toString(),
                'qrCode': scannedQrCode,
                'endTime': null,
              }
            ];
            lastLog['breaks'] = breaksList;
            logs[logs.length - 1] = lastLog;

            await userDocRef.update({
              'Logs': logs,
            });
          } // jeżeli wypełniony ostatni indeks w tablicy breaks, czas startu przerwy to updatujemy endTime przerwy, jeżeli ponownie zeskanowaliśmy
          else if (workLogs.last.breaks?.last.endTime == null &&
              workLogs.last.endWork == null) {
            Map<String, dynamic> lastLog = logs.last;
            List<dynamic> breaksList = lastLog['breaks'];
            Map<String, dynamic> lastBreak = breaksList.last;
            lastBreak['endTime'] = currentTime.toString();
            breaksList[breaksList.length - 1] = lastBreak;
            lastLog['breaks'] = breaksList;
            logs[logs.length - 1] = lastLog;

            await userDocRef.update({
              'Logs': logs,
            });
          } // jeżeli wypełniony ostatni indeks w tablicy breaks, czas zakończenia przerwy to tworzymy nowy indeks w tabeli breaks z czasem startTime
          else if (workLogs.last.breaks?.last.endTime != null &&
              workLogs.last.endWork == null) {
            Map<String, dynamic> lastLog = logs.last;

            List<Map<String, dynamic>> breaksList = [
              ...lastLog['breaks'],
              {
                'endTime': null,
                'qrCode': scannedQrCode,
                'startTime': currentTime.toString(),
              }
            ];
            lastLog['breaks'] = breaksList;
            logs[logs.length - 1] = lastLog;

            await userDocRef.update({
              'Logs': logs,
            });
          }
        }
      } else {
        // Utwórz nowy rekord w tablicy Logs z wpisem o indeksie 0 z startTime, jeśli dokument nie istnieje

        await userDocRef.set({
          'Logs': [
            {
              'breaks': [],
              'endWork': null,
              'startWork': WorkEvent(
                qrCode: scannedQrCode,
                time: currentTime,
              ).toJson(),
            }
          ]
        });
      }
    } catch (e) {
      print(e);
      throw FirestoreException();
    }
  }
}
