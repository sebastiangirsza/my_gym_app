import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_gym_app/app/home/my_account/add_data/cubit/add_data_cubit.dart';

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
  var yourHeight = '';
  var date = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(),
      child: BlocListener<DataCubit, DataState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
        },
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
                  height: 600,
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
                                      controller: dateInput,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.calendar_month),
                                      ),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now());

                                        if (pickedDate != null) {
                                          print(pickedDate);
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(formattedDate);
                                          setState(() {
                                            dateInput.text = formattedDate;
                                          });
                                        } else {}
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Text('Wzrost',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                  dateInput.text.isEmpty ||
                                  yourHeight.isEmpty
                              ? null
                              : () {
                                  context.read<DataCubit>().addData(
                                      yourName: yourName,
                                      yourDate: dateInput.text,
                                      yourHeight: yourHeight,
                                      date: date.toString());
                                  state.saved;
                                },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
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
      ),
    );
  }
}
