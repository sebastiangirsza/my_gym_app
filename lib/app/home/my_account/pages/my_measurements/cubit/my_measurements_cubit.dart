import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'my_measurements_state.dart';

class MyMeasurementsCubit extends Cubit<MyMeasurementsState> {
  MyMeasurementsCubit()
      : super(const MyMeasurementsState(
          measurements: [],
        ));

  Future<void> addMeasurements({
    required String date,
    required String neck,
    required String chest,
    required String biceps,
    required String forearm,
    required String waist,
    required String bellyWeist,
    required String hips,
    required String thigh,
    required String calf,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
        .collection('measurements')
        .add({
      'date': date,
      'neck': neck,
      'chest': chest,
      'biceps': biceps,
      'forearm': forearm,
      'waist': waist,
      'belly_weist': bellyWeist,
      'hips': hips,
      'thigh': thigh,
      'calf': calf,
    });
    emit(const MyMeasurementsState(measurements: []));
  }

  StreamSubscription? _streamSubscriptionMeasurements;

  Future<void> readMeasurements() async {
    emit(
      const MyMeasurementsState(
        measurements: [],
      ),
    );

    _streamSubscriptionMeasurements = FirebaseFirestore.instance
        .collection('users')
        .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
        .collection('measurements')
        .orderBy('date', descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      emit(
        MyMeasurementsState(
          measurements: data.docs,
        ),
      );
    })
      ..onError((error) {
        emit(
          const MyMeasurementsState(
            measurements: [],
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscriptionMeasurements?.cancel();
    return super.close();
  }
}
