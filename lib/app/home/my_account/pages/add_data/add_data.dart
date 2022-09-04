import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_gym_app/app/home/my_account/pages/add_data/cubit/add_data_cubit.dart';

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
              appBar: AppBar(
                actions: [
                  IconButton(
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
                  height: 368,
                  margin: const EdgeInsets.only(right: 25, left: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15, right: 25, left: 25),
                    child: Column(
                      children: [
                        Text(
                          'Twoje dane',
                          style: GoogleFonts.robotoSlab(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
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
