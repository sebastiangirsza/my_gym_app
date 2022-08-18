import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/my_account/my_account_page_content.dart';
import 'package:my_gym_app/app/home/plans/plans_page_content.dart';
import 'package:my_gym_app/app/home/start/start_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
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
          body: Builder(builder: (context) {
            if (currentIndex == 0) {
              return const StartPageContent();
            }
            if (currentIndex == 1) {
              return const PlansPageContent();
            }
            return MyAcountPageContent(email: widget.user.email);
          }),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            selectedFontSize: 15,
            unselectedFontSize: 12,
            currentIndex: currentIndex,
            onTap: (newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.reviews),
                label: 'Start',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Plany',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Moje konto',
              ),
            ],
          ),
        ),
      );
}
