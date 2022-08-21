part of 'exercises_cubit.dart';

@immutable
class ExercisesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const ExercisesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
