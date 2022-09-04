part of 'my_measurements_cubit.dart';

@immutable
class MyMeasurementsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> measurements;

  const MyMeasurementsState({
    required this.measurements,
  });
}
