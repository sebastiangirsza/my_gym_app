import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/features/home/plans/body_parts/exercises/body_part_back_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/body_parts/exercises_page_content.dart';

class PlansPageContent extends StatelessWidget {
  const PlansPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final result = [
    'Ćwiczenia',
    'Twoje plany',
    'Utwórz nowy plan',
  ];

  final image = [
    'images/exercises.jpg',
    'images/plans.jpeg',
    'images/newplan.jpg',
  ];

  final routes = [
    const ExercisesPageContent(),
    const BodyPartBackPageContent(),
    const ExercisesPageContent(),
  ];
  return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 10.0, left: 25, right: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  opacity: 0.9,
                  image: AssetImage(
                    (image[index]),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result[index],
                        style: GoogleFonts.robotoSlab(
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                          fontSize: 20,
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
        );
      });
}
