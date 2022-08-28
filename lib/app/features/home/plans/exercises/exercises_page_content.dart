import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/appbar_wallpaper.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/add_exercises_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/exercises/cubit/exercises_cubit.dart';
import 'package:my_gym_app/app/features/home/plans/exercises/exercises/body_part_page_content.dart';

class BodyPartsList extends StatelessWidget {
  const BodyPartsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExercisesCubit(),
      child: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          return _myListView(context);
        },
      ),
    );
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
    const AppBarWallpaper(page: AddExercisesPageContent()),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Plecy')),
    const AppBarWallpaper(
        page: BodyPartPageContent(bodyParts: 'Klatka piersiowa')),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Biceps')),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Triceps')),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Barki')),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Nogi')),
    const AppBarWallpaper(page: BodyPartPageContent(bodyParts: 'Brzuch')),
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
