import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gym_app/app/cubit/root_cubit.dart';
import 'package:my_gym_app/app/home/my_account/my_account_page_content.dart';
import 'package:my_gym_app/app/home/plans/plans_page_content.dart';
import 'package:my_gym_app/app/home/start/start_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RootCubit()..start(),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey[900],
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text('My GYM App'),
                leading: const Icon(Icons.menu),
                actions: [
                  IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.person),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              MyAcountPageContent(email: state.user?.email),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (currentIndex == 0) {
                    return const StartPageContent();
                  }
                  if (currentIndex == 1) {
                    return const PlansPageContent();
                  }
                  if (currentIndex == 2) {
                    return const PlansPageContent();
                  }
                  return const PlansPageContent();
                },
              ),
              bottomNavigationBar: Container(
                color: Colors.white,
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  fixedColor: Colors.white,
                  selectedFontSize: 15,
                  unselectedFontSize: 11,
                  unselectedItemColor: Colors.grey,
                  currentIndex: currentIndex,
                  onTap: (newIndex) {
                    setState(() {
                      currentIndex = newIndex;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.fitness_center),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.exit_to_app),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: '',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
