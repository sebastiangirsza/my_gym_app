import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExercisesPageContent extends StatefulWidget {
  const AddExercisesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercisesPageContent> createState() =>
      _AddExercisesPageContentState();
}

class _AddExercisesPageContentState extends State<AddExercisesPageContent> {
  var partName = '';

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.6)),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Podaj nazwę ćwiczenia',
                  ),
                  onChanged: (newPart) {
                    setState(() {
                      partName = newPart;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: partName.isEmpty
                      ? null
                      : () {
                          FirebaseFirestore.instance.collection('gym').add({
                            'body_part': partName,
                          });
                          Navigator.pop(context);
                        },
                  child: const Text('Dodaj'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
