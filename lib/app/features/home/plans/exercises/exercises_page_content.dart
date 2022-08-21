import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/add_exercises_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/exercises/cubit/exercises_cubit.dart';

class ExercisesPageContent extends StatefulWidget {
  const ExercisesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<ExercisesPageContent> createState() => _ExercisesPageContentState();
}

class _ExercisesPageContentState extends State<ExercisesPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExercisesCubit()..start(),
      child: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.3,
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
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 10.0, left: 25, right: 25),
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
                                        builder: (_) =>
                                            const AddExercisesPageContent(),
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.add))
                            ],
                          ),
                        )),
                  ),
                  for (final document in documents) ...[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(document['body_part']),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(document['exercises']),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('gym')
                                            .doc(document.id)
                                            .delete();
                                      },
                                      child: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
