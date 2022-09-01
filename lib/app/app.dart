import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/home_page.dart';
import 'package:my_gym_app/app/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My GYM App',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          // canvasColor: Colors.white.withOpacity(0.6),
          brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.robotoSlab(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            button: GoogleFonts.robotoSlab(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          )),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
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
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return const HomePage();
        },
      ),
    );
  }
}
