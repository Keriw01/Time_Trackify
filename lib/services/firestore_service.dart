import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_trackify/exceptions/exceptions.dart';
import 'package:time_trackify/models/qr_codes.dart';
import 'package:time_trackify/models/user_data.dart';

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
}
