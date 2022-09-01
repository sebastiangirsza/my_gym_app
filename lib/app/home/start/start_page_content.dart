import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPageContent extends StatelessWidget {
  const StartPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 200,
                            height: 400,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Plecy',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 200,
                            height: 400,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nogi',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 200,
                            height: 400,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Klatka piersiowa',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 400,
                            height: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Plecy',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 400,
                            height: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nogi',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            width: 400,
                            height: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  opacity: 0.5,
                                  image: AssetImage(
                                    'images/addexercises.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Klatka piersiowa',
                                        style: GoogleFonts.robotoSlab(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
