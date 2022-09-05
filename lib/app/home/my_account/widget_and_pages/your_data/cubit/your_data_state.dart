part of 'your_data_cubit.dart';

@immutable
class DataState {
  final List<DataModel> documents;
  final bool saved;

  const DataState({
    this.documents = const [],
    this.saved = false,
  });
}
