import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/my_measurements/cubit/my_measurements_cubit.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/my_measurements/my_measurements.dart';

class MyMeasurementsWidget extends StatelessWidget {
  MyMeasurementsWidget({
    Key? key,
  }) : super(key: key);

  final bodyParts = [
    'Szyja/kark',
    'Klatka piersiowa',
    'Ramię/biceps',
    'Przedramię',
    'Talia',
    'Brzuch/pas',
    'Biodra',
    'Udo',
    'Łydka'
  ];
  final measurementList = [
    'neck',
    'chest',
    'biceps',
    'forearm',
    'waist',
    'belly_weist',
    'hips',
    'thigh',
    'calf',
  ];

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
          padding: const EdgeInsets.only(top: 10.0, bottom: 15),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text(
                        'Twoje pomiary',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const MyMeasurementsPageContent(),
                              fullscreenDialog: true,
                              // Dodaje X w lewym górnym rogu
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
                SizedBox(
                  height: 370,
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
                              BlocProvider(
                                create: (context) =>
                                    MyMeasurementsCubit()..readMeasurements(),
                                child: BlocBuilder<MyMeasurementsCubit,
                                    MyMeasurementsState>(
                                  builder: (context, state) {
                                    final measurements = state.measurements;
                                    return Column(
                                      children: [
                                        for (final measurement
                                            in measurements) ...[
                                          const SizedBox(height: 20),
                                          Text(
                                              measurement[
                                                  measurementList[index]],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                        ],
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MyMeasurementsPageContent(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text('Aktualizuj pomiary')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
