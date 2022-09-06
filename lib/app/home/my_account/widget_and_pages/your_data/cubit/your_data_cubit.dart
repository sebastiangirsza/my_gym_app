import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_gym_app/repositories/data_repository.dart';

part 'your_data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this._dataRepository) : super(const DataState());

  final DataRepository _dataRepository;

  Future<void> addData(
    String yourName,
    DateTime yourDate,
    String yourHeight,
    DateTime date,
  ) async {
    await _dataRepository.addData(yourName, yourDate, yourHeight, date);
    emit(const DataState(saved: true));
  }

// FirebaseFirestore.instance
//         .collection('users')
//         .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
//         .collection('yourData')
//         .add({
//       'date': date,
//       'your_name': yourName,
//       'your_date': yourDate,
//       'your_height': yourHeight,
//     });

  // StreamSubscription? _streamSubscription;

  // Future<void> start() async {
  //   emit(
  //     const DataState(
  //       documents: [],
  //     ),
  //   );

  //   _streamSubscription = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('2EjvkciByydb4p3qZ93fJi03JHj2')
  //       .collection('yourData')
  //       .orderBy('date', descending: true)
  //       .limit(1)
  //       .snapshots()
  //       .listen((data) {
  //     final dataModels = data.docs.map((doc) {
  //       return DataModel(
  //         yourName: doc['your_name'],
  //         yourDate: doc['your_date'],
  //         yourHeight: doc['your_height'],
  //         date: doc['date'],
  //       );
  //     }).toList();
  //     emit(
  //       DataState(
  //         documents: dataModels,
  //       ),
  //     );
  //   })
  //     ..onError((error) {
  //       emit(
  //         const DataState(
  //           documents: [],
  //         ),
  //       );
  //     });
  // }

  // @override
  // Future<void> close() {
  //   _streamSubscription?.cancel();
  //   return super.close();
  // }
}
