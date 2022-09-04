import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:my_gym_app/models/data_model.dart';

part 'add_data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit()
      : super(const DataState(
          documents: [],
        ));

  Future<void> addData({
    required String yourName,
    required String yourDate,
    required String yourHeight,
    required String date,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
        .collection('yourData')
        .add({
      'date': date,
      'your_name': yourName,
      'your_date': yourDate,
      'your_height': yourHeight,
    });
    emit(const DataState(saved: true, documents: []));
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const DataState(
        documents: [],
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
        .collection('yourData')
        .orderBy('date', descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      final dataModels = data.docs.map((doc) {
        return DataModel(
          name: doc['your_name'],
          date: (doc['your_date'] as Timestamp).toDate(),
          height: doc['your_height'],
          saveDate: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
      emit(
        DataState(
          documents: dataModels,
        ),
      );
    })
      ..onError((error) {
        emit(
          const DataState(
            documents: [],
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
