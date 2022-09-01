import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/my_account/your_data_widget/your_data_widget.dart';

class MyAcountPageContent extends StatelessWidget {
  MyAcountPageContent({
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
          final bodyParts = [
            'Szyja/kark',
            'Klatka piersiowa',
            'Ramię/biceps',
            'Przedramię',
            'Talia',
            'Brzuch/pas',
            'Biodra',
            'Udo',
          ];
          final pomiary = [
            '30cm',
            '30cm',
            '30cm',
            '30cm',
            '30cm',
            '30cm',
            '30cm',
            '30cm',
          ];

          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong: ${state.errorMessage}'));
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: ListView(
              children: [
                YourDataWidget(),
                const SizedBox(
                  height: 25,
                ),
                Center(
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
                            SizedBox(
                              height: 350,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: bodyParts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                child: const Text('Aktualizuj pomiary')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[800],
                    ),
                    margin: const EdgeInsets.only(right: 25, left: 25),
                    height: 150,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Jestes zalogowany jako $email',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                context.read<RootCubit>().signOut();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text('Wyloguj')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
