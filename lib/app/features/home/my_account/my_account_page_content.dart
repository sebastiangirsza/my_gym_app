import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';

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
          color: const Color.fromARGB(255, 150, 150, 150).withOpacity(0.9),
        ),
        height: 150,
        margin: const EdgeInsets.all(50),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.white,
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
                    context.read<RootCubit>().signOut();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black),
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
