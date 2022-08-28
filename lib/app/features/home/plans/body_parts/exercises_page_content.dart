import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/add_exercises_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/body_parts/cubit/exercises_cubit.dart';
import 'package:my_gym_app/app/features/home/plans/body_parts/exercises/body_part_page_content.dart';

class ExercisesPageContent extends StatelessWidget {
  const ExercisesPageContent({
    Key? key,
  }) : super(key: key);

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
                backgroundColor: Colors.white.withAlpha(60),
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
                        blurRadius: 20.0,
                        color: Colors.white,
                      ),
                    ],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              body: const BodyPartsList(),
            ),
          );
        },
      ),
    );
  }
}

class BodyPartsList extends StatelessWidget {
  const BodyPartsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final bodyParts = [
    'Dodaj ćwiczenie',
    'Plecy',
    'Klatka piersiowa',
    'Biceps',
    'Triceps',
    'Barki',
    'Nogi',
    'Brzuch',
  ];
  final routes = [
    const AddExercisesPageContent(),
    const BodyPartPageContent(
      bodyParts: 'Plecy',
    ),
    const BodyPartPageContent(
      bodyParts: 'Klatka piersiowa',
    ),
    const BodyPartPageContent(
      bodyParts: 'Biceps',
    ),
    const BodyPartPageContent(
      bodyParts: 'Triceps',
    ),
    const BodyPartPageContent(
      bodyParts: 'Barki',
    ),
    const BodyPartPageContent(
      bodyParts: 'Nogi',
    ),
    const BodyPartPageContent(
      bodyParts: 'Brzuch',
    ),
  ];

  final image = [
    'images/addexercises.jpg',
    'images/exercises/back.jpg',
    'images/exercises/bench.jpg',
    'images/exercises/biceps.jpg',
    'images/exercises/triceps.jpg',
    'images/exercises/schoulders.jpg',
    'images/exercises/legs.jpg',
    'images/exercises/stomach.jpg',
  ];

  return ListView.builder(
      itemCount: bodyParts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.9),
                ),
                height: 75,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage(
                        (image[index]),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => (routes[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            bodyParts[index],
                            style: GoogleFonts.robotoSlab(
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 10.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
