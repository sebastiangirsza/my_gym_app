import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';

class MyAcountPageContent extends StatelessWidget {
  const MyAcountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jestes zalogowany jako $email',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RootCubit>().signOut();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text(
                      'Wyloguj',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
