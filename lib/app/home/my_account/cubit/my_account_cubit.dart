import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_gym_app/models/data_model.dart';
import 'package:my_gym_app/repositories/data_repository.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit(this._dataRpository) : super(const MyAccountState());

  final DataRepository _dataRpository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _dataRpository.getDataStream().listen(
      (data) {
        emit(MyAccountState(data: data));
      },
    )..onError(
        (error) {
          emit(MyAccountState());
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
