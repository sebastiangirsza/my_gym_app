import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/cubit/add_exercises_cubit.dart';

class AddExercisesPageContent extends StatefulWidget {
  const AddExercisesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercisesPageContent> createState() =>
      _AddExercisesPageContentState();
}

class _AddExercisesPageContentState extends State<AddExercisesPageContent> {
  var partName = 'Plecy';
  var exercisesName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExercisesCubit(),
      child: BlocBuilder<AddExercisesCubit, AddExercisesState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.35,
                image: AssetImage(
                  'images/login_page_wallpaper.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                shadowColor: Colors.white,
                elevation: 10,
                backgroundColor: Colors.white.withOpacity(0.6),
                centerTitle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                title: Text(
                  'My Gym App',
                  style: GoogleFonts.robotoSlab(
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 8.0,
                        color: Colors.white,
                      ),
                    ],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        opacity: 0.6,
                        image: AssetImage(
                          'images/addexercises.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              'Wybierz partię',
                              style: GoogleFonts.robotoSlab(
                                shadows: const <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 8.0,
                                    color: Colors.black,
                                  ),
                                ],
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: partName,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                elevation: 0,
                                dropdownColor: Colors.black.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15),
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                                onChanged: (String? newPart) {
                                  setState(() {
                                    partName = newPart!;
                                  });
                                },
                                items: <String>[
                                  'Plecy',
                                  'Klatka piersiowa',
                                  'Biceps',
                                  'Triceps',
                                  'Barki',
                                  'Nogi',
                                  'Brzuch',
                                ].map<DropdownMenuItem<String>>(
                                    (String partName) {
                                  return DropdownMenuItem<String>(
                                    value: partName,
                                    child: Center(
                                        child: Text(
                                      partName,
                                      style: GoogleFonts.robotoSlab(
                                        shadows: const <Shadow>[
                                          Shadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 8.0,
                                            color: Colors.black,
                                          ),
                                        ],
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              'Podaj nazwę ćwiczenia',
                              style: GoogleFonts.robotoSlab(
                                shadows: const <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 8.0,
                                    color: Colors.black,
                                  ),
                                ],
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 25),
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: GoogleFonts.robotoSlab(
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 8.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                  fontSize: 18,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: '',
                                ),
                                onChanged: (newExercises) {
                                  setState(() {
                                    exercisesName = newExercises;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 30.0, right: 30),
                              child: ElevatedButton(
                                onPressed: partName.isEmpty ||
                                        exercisesName.isEmpty
                                    ? null
                                    : () {
                                        context.read<AddExercisesCubit>().add(
                                              partName: partName,
                                              exercisesName: exercisesName,
                                            );
                                        Navigator.pop(context);
                                      },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                ),
                                child: const Text(
                                  'Dodaj ćwiczenie',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
