import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/my_account/my_account_widgets/my_measurements_widget.dart';
import 'package:my_gym_app/app/home/my_account/my_account_widgets/sign_out_widget.dart';
import 'package:my_gym_app/app/home/my_account/my_account_widgets/your_data_widget.dart';

class MyAcountPageContent extends StatelessWidget {
  const MyAcountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocListener<RootCubit, RootState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
        },
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
                  const YourDataWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  MyMeasurementsWidget(bodyParts: bodyParts, pomiary: pomiary),
                  const SizedBox(
                    height: 25,
                  ),
                  SignOutWidget(email: email),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
