import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/features/home/plans/add_exercises/add_exercises_page_content.dart';
import 'package:my_gym_app/app/features/home/plans/body_parts/cubit/exercises_cubit.dart';

class BodyPartBicepsPageContent extends StatefulWidget {
  const BodyPartBicepsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyPartBicepsPageContent> createState() =>
      _BodyPartBicepsPageContentState();
}

class _BodyPartBicepsPageContentState extends State<BodyPartBicepsPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExercisesCubit()..start(),
      child: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Center(child: Text('Coś poszło nie tak'));
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

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
                        blurRadius: 8.0,
                        color: Colors.white,
                      ),
                    ],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  for (final document in documents) ...[
                    if (document['body_part'] == 'Biceps') ...[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(document['exercises']),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<ExercisesCubit>()
                                              .delete(document: document.id);
                                        },
                                        child: const Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
