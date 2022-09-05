import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/my_measurements/cubit/my_measurements_cubit.dart';

class MyMeasurementsPageContent extends StatefulWidget {
  const MyMeasurementsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MyMeasurementsPageContent> createState() =>
      _MyMeasurementsPageContentState();
}

class _MyMeasurementsPageContentState extends State<MyMeasurementsPageContent> {
  var date = DateTime.now();
  var neck = '';
  var chest = '';
  var biceps = '';
  var forearm = '';
  var waist = '';
  var bellyWeist = '';
  var hips = '';
  var thigh = '';
  var calf = '';

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
    'bellyWeist',
    'hips',
    'thigh',
    'calf',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyMeasurementsCubit(),
      child: BlocListener<MyMeasurementsCubit, MyMeasurementsState>(
        listener: (context, state) {
          // if (state.saved) {
          //   Navigator.of(context).pop();
          // }
        },
        child: BlocBuilder<MyMeasurementsCubit, MyMeasurementsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<MyMeasurementsCubit>().addMeasurements(
                              date: date.toString(),
                              neck: neck,
                              chest: chest,
                              biceps: biceps,
                              forearm: forearm,
                              waist: waist,
                              bellyWeist: bellyWeist,
                              hips: hips,
                              thigh: thigh,
                              calf: calf,
                            );
                      },
                      icon: const Icon(Icons.check))
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[800],
                  ),
                  margin: const EdgeInsets.only(right: 25, left: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15, right: 25, left: 25),
                    child: SizedBox(
                      height: 600,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              'Twoje pomiary',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 600,
                            child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: bodyParts.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 176,
                                      child: Text(bodyParts[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ),
                                    SizedBox(
                                      width: 60,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter.digitsOnly
                                        // ],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (newName) {
                                          setState(() {
                                            measurementList[index] = newName;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      child: Text(' cm'),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
