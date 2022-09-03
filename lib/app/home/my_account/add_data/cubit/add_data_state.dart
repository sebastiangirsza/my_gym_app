part of 'add_data_cubit.dart';

@immutable
class DataState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool saved;

  const DataState({
    required this.documents,
    this.saved = false,
  });
}
