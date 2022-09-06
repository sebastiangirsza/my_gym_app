import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gym_app/app/home/my_account/cubit/my_account_cubit.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/your_data/your_data.dart';
import 'package:my_gym_app/repositories/data_repository.dart';

class YourDataWidget extends StatelessWidget {
  const YourDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
        ),
        margin: const EdgeInsets.only(right: 25, left: 25),
        height: 220,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 55.0),
                    child: Text(
                      'Twoje dane',
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
                            builder: (_) => const DataPageContent(),
                            fullscreenDialog: true,
                            // Dodaje X w lewym górnym rogu
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Imię i nazwisko',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: 20),
                      Text('Data urodzenia',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: 20),
                      Text('Wzrost',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: 20),
                    ],
                  ),
                  BlocProvider(
                      create: (context) =>
                          MyAccountCubit(DataRepository())..start(),
                      child: BlocBuilder<MyAccountCubit, MyAccountState>(
                          builder: (context, state) {
                        final dataModels = state.data;
                        return Column(
                          children: [
                            for (final dataModel in dataModels) ...[
                              Text(dataModel.yourName,
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 20),
                              Text(dataModel.dateFormatted(),
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 20),
                              Text('${dataModel.yourHeight} cm',
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 20),
                            ],
                          ],
                        );
                      }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
