part of 'data_cubit.dart';

@immutable
class DataState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  const DataState({
    required this.documents,
  });
}
