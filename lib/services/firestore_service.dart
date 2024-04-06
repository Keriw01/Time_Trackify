import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserRole(String userId, {String role = "worker"}) async {
    try {
      await _firestore.collection('Users').doc(userId).update({
        'role': role,
      });
    } catch (e) {
      print('Wystąpił błąd podczas aktualizacji roli użytkownika: $e');
      throw e;
    }
  }
}
