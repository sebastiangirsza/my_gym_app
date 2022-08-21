import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAcountPageContent extends StatelessWidget {
  const MyAcountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0),
        ),
        height: 150,
        margin: const EdgeInsets.all(50),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(255, 196, 196, 196),
                blurRadius: 15,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Jestes zalogowany jako $email',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 61, 61, 61),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 61, 61, 61)),
                  child: const Text(
                    'Wyloguj',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
