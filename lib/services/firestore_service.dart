import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_trackify/models/user_data.dart';
import 'package:time_trackify/utils/converts.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUser(
    String userId, {
    String role = 'worker',
    String status = 'absent',
  }) async {
    try {
      await _firestore.collection('Users').doc(userId).update({
        'role': role,
        'status': status,
      });
    } catch (e) {
      print('Wystąpił błąd podczas aktualizacji roli użytkownika: $e');
      throw e;
    }
  }

  Future<UserData> getUser(String? userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Users').doc(userId).get();

      Map<String, dynamic>? data = snapshot.data();

      if (data != null) {
        String statusString = data['status'];
        String status = convertStringToUserStatus(statusString);
        data['status'] = status;
        return UserData.fromJson(data);
      } else {
        print('Document with ID $userId does not exist.');
        throw Exception();
      }
    } catch (e) {
      print('Wystąpił błąd podczas pobierania użytkownika: $e');
      throw e;
    }
  }
}
