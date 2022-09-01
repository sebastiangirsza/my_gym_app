import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

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
    await FirebaseFirestore.instance.collection('yourData').add({
      'date': date,
      'your_name': yourName,
      'your_date': yourDate,
      'your_height': yourHeight,
    });
  }

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const DataState(
        documents: [],
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('yourData')
        .orderBy('date', descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      emit(
        DataState(
          documents: data.docs,
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
