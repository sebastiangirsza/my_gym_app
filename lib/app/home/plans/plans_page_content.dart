import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/plans/exercises_page_content.dart';

class PlansPageContent extends StatefulWidget {
  const PlansPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<PlansPageContent> createState() => _PlansPageContentState();
}

class _PlansPageContentState extends State<PlansPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          TitlePlans(),
          TitleNewPlan(),
          TitleExercises(),
        ],
      ),
    );
  }
}

class TitleExercises extends StatelessWidget {
  const TitleExercises({
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
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              opacity: 0.9,
              image: AssetImage(
                'images/exercises.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ExercisesPageContent(),
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
                    'Ćwiczenia',
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
  }
}

class TitlePlans extends StatelessWidget {
  const TitlePlans({
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
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              opacity: 0.9,
              image: AssetImage(
                'images/plans.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ExercisesPageContent(),
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
                    'Twoje plany',
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
  }
}

class TitleNewPlan extends StatelessWidget {
  const TitleNewPlan({
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
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              opacity: 0.9,
              image: AssetImage(
                'images/newplan.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 100,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ExercisesPageContent(),
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
                    'Utwórz nowy plan',
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
  }
}
