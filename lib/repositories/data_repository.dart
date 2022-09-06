import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_gym_app/models/data_model.dart';

class DataRepository {
  Stream<List<DataModel>> getDataStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('yourData')
        .orderBy('date', descending: true)
        .limit(1)
        .snapshots()
        .map((querySnapshots) {
      return querySnapshots.docs.map(
        (doc) {
          return DataModel(
            yourName: doc['your_name'],
            yourDate: (doc['your_date'] as Timestamp).toDate(),
            yourHeight: doc['your_height'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> addData(
    String yourName,
    DateTime yourDate,
    String yourHeight,
    DateTime date,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('yourData')
        .add({
      'date': date,
      'your_name': yourName,
      'your_date': yourDate,
      'your_height': yourHeight,
    });
  }
}
