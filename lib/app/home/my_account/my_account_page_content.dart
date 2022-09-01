import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/my_account/data/cubit/data_cubit.dart';
import 'package:my_gym_app/app/home/my_account/data/data.dart';

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
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[800],
                    ),
                    margin: const EdgeInsets.only(right: 25, left: 25),
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 15, right: 25, left: 25),
                      child: Column(
                        children: [
                          Text('Twoje dane',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Imię i nazwisko',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const SizedBox(height: 20),
                                  Text('Data urodzenia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const SizedBox(height: 20),
                                  Text('Waga',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const SizedBox(height: 20),
                                  Text('Wzrost',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const SizedBox(height: 20),
                                ],
                              ),
                              BlocProvider(
                                  create: (context) => DataCubit()..start(),
                                  child: BlocBuilder<DataCubit, DataState>(
                                      builder: (context, state) {
                                    final documents = state.documents;
                                    return Column(
                                      children: [
                                        for (final document in documents) ...[
                                          Text(document['your_name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          const SizedBox(height: 20),
                                          Text(document['your_date'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          const SizedBox(height: 20),
                                          Text(document['your_weight'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          const SizedBox(height: 20),
                                          Text(document['your_height'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1),
                                          const SizedBox(height: 20),
                                        ],
                                      ],
                                    );
                                  }))
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const DataPageContent(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text('Edytuj')),
                        ],
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
