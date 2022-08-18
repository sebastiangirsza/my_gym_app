import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Trwa ładowanie'));
          }

          final documents = snapshot.data!.docs;

          return ListView(
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
                              onPressed: () {}, child: const Icon(Icons.add))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(document['body_part']),
                                  Text(document['exercises']),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {},
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
          );
        });
  }
}
