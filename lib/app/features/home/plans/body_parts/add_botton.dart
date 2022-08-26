import 'package:flutter/material.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/add_exercises_page_content.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 25, right: 25),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dodaj ćwiczenie'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AddExercisesPageContent(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add))
              ],
            ),
          )),
    );
  }
}
