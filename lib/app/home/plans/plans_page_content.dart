import 'package:flutter/material.dart';
import 'package:my_gym_app/app/home/plans/exercises_page_content.dart';

class PlansPageContent extends StatefulWidget {
  PlansPageContent({
    Key? key,
  }) : super(key: key);

  final titles = [
    'Ćwiczenia',
    'Moje plany',
    'Utwórz plan',
  ];

  @override
  State<PlansPageContent> createState() => _PlansPageContentState();
}

class _PlansPageContentState extends State<PlansPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 25, right: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.6),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ExercisesPageContent(),
                    ),
                  );
                },
                title: const Center(child: Text('Ćwiczenia')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.6),
                ),
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ExercisesPageContent(),
                            ),
                          );
                        },
                        child: const Text('Ćwiczenia'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Utwórz plan'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Moje plany'),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
