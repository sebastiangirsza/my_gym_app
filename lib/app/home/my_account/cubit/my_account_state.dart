part of 'my_account_cubit.dart';

@immutable
class MyAccountState {
  const MyAccountState({
    this.data = const [],
  });
  final List<DataModel> data;
}
