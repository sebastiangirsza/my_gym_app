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
  var partName = 'Plecy';
  var exercisesName = '';

  @override
  Widget build(BuildContext context) {
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
                  blurRadius: 20.0,
                  color: Colors.white,
                ),
              ],
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
                const SizedBox(height: 25),
                const Text('Wybierz partię'),
                DropdownButton<String>(
                  value: partName,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
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
                  ].map<DropdownMenuItem<String>>((String partName) {
                    return DropdownMenuItem<String>(
                      value: partName,
                      child: Text(partName),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 25),
                const Text('Podaj nazwę ćwiczenia'),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Podaj nazwę ćwiczenia',
                    ),
                    onChanged: (newExercises) {
                      setState(() {
                        exercisesName = newExercises;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: partName.isEmpty || exercisesName.isEmpty
                      ? null
                      : () {
                          FirebaseFirestore.instance.collection('gym').add({
                            'body_part': partName,
                            'exercises': exercisesName,
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
