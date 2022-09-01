import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_gym_app/app/home/my_account/data/cubit/data_cubit.dart';
import 'package:my_gym_app/app/home/my_account/my_account_page_content.dart';

class DataPageContent extends StatefulWidget {
  const DataPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DataPageContent> createState() => _DataPageContentState();
}

class _DataPageContentState extends State<DataPageContent> {
  var yourName = '';
  var yourDate = '';
  var yourWeight = '';
  var yourHeight = '';
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[800],
                ),
                margin: const EdgeInsets.only(right: 25, left: 25),
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 15, right: 25, left: 25),
                  child: Column(
                    children: [
                      Text('Twoje dane',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Imię i nazwisko',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  TextField(
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: const InputDecoration(
                                      hintText: '',
                                    ),
                                    onChanged: (newName) {
                                      setState(() {
                                        yourName = newName;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Data urodzenia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  TextField(
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: const InputDecoration(
                                      hintText: '',
                                    ),
                                    onChanged: (newDate) {
                                      setState(() {
                                        yourDate = newDate;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Waga',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  TextField(
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: const InputDecoration(
                                      hintText: '',
                                    ),
                                    onChanged: (newWeight) {
                                      setState(() {
                                        yourWeight = newWeight;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Wzrost',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  TextField(
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: const InputDecoration(
                                      hintText: '',
                                    ),
                                    onChanged: (newHeight) {
                                      setState(() {
                                        yourHeight = newHeight;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: yourName.isEmpty ||
                                yourDate.isEmpty ||
                                yourHeight.isEmpty ||
                                yourWeight.isEmpty
                            ? null
                            : () {
                                context.read<DataCubit>().addData(
                                    yourName: yourName,
                                    yourDate: yourDate,
                                    yourWeight: yourWeight,
                                    yourHeight: yourHeight,
                                    date: date.toString());
                                Navigator.of(context).pop();
                              },
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: const Text('Zapisz'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
