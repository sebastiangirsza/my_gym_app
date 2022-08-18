import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/plans/add_exercises_page_content.dart';

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
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('gym').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black),
                    'Coś poszło nie tak'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Text(
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black),
                    'Trwa ładowanie'));
          }

          final documents = snapshot.data!.docs;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.4,
                image: AssetImage(
                  'images/login_page_wallpaper.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(0.6),
                centerTitle: true,
                title: Text(
                  'My Gym App',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 61, 61, 61),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                      padding: const EdgeInsets.all(10.0),
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
        });
  }
}
