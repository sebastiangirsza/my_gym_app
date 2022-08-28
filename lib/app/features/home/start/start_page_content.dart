import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/appbar_wallpaper.dart';
import 'package:my_gym_app/app/features/home/start/calculator/calculator.dart';
import 'package:my_gym_app/app/features/home/start/calendar/calendar.dart';
import 'package:my_gym_app/app/features/home/start/your_measurements/your_measurements_page_content.dart';

class StartPageContent extends StatelessWidget {
  const StartPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final result = [
    'Twoje pomiary',
    'Kalkulator zapotrzebowania',
    'Kalendarz',
  ];

  final image = [
    'images/exercises.jpg',
    'images/plans.jpeg',
    'images/newplan.jpg',
  ];

  final routes = [
    const AppBarWallpaper(page: YourMeasurementsPageContent()),
    const AppBarWallpaper(page: CalculatorPageContent()),
    const AppBarWallpaper(page: CalendarPageContent()),
  ];
  return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 10.0, left: 25, right: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.9),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage(
                    (image[index]),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => (routes[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result[index],
                        style: GoogleFonts.robotoSlab(
                          shadows: const <Shadow>[
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
