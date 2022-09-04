import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';

class MyMeasurementsWidget extends StatelessWidget {
  const MyMeasurementsWidget({
    Key? key,
    required this.bodyParts,
    required this.pomiary,
  }) : super(key: key);

  final List<String> bodyParts;
  final List<String> pomiary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
        ),
        margin: const EdgeInsets.only(right: 25, left: 25),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Twoje pomiary',
                  style: GoogleFonts.robotoSlab(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: bodyParts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(bodyParts[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Text(pomiary[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<RootCubit>().signOut();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text('Aktualizuj pomiary')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
