part of 'root_cubit.dart';

@immutable
class RootState {
  final User? user;
  final String errorMessage;
  final bool isLoading;
  final bool saved;

  const RootState({
    required this.user,
    required this.isLoading,
    required this.errorMessage,
    this.saved = false,
  });
}
