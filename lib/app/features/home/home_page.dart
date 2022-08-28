import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/features/home/my_account/my_account_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/plans_page_content.dart';
import 'package:my_gym_app/app/features/home/start/start_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RootCubit()..start(),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
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
                  shadowColor: Colors.white,
                  elevation: 10,
                  backgroundColor: Colors.white.withAlpha(60),
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                body: Builder(builder: (context) {
                  if (currentIndex == 0) {
                    return const StartPageContent();
                  }
                  if (currentIndex == 1) {
                    return const PlansPageContent();
                  }
                  return MyAcountPageContent(email: state.user?.email);
                }),
                bottomNavigationBar: Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.black.withOpacity(0.99),
                      fixedColor: Colors.white,
                      selectedFontSize: 15,
                      unselectedFontSize: 11,
                      unselectedItemColor: Colors.white.withOpacity(0.5),
                      currentIndex: currentIndex,
                      onTap: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                        });
                      },
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Start',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.fitness_center),
                          label: 'Plany',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Moje konto',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
