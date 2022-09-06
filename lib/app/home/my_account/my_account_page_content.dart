import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/sign_out_widget.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/your_data_widget.dart';

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
            if (state.errorMessage.isNotEmpty) {
              return Center(
                  child: Text('Something went wrong: ${state.errorMessage}'));
            }
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: ListView(
                  children: [
                    const YourDataWidget(),
                    const SizedBox(height: 25),
                    SignOutWidget(email: email),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
