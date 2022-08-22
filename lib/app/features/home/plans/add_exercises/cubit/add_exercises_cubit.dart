import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_exercises_state.dart';

class AddExercisesCubit extends Cubit<AddExercisesState> {
  AddExercisesCubit() : super(AddExercisesState());

  Future<void> add(
      {required String partName, required String exercisesName}) async {
    FirebaseFirestore.instance.collection('gym').add({
      'body_part': partName,
      'exercises': exercisesName,
    });
  }
}
