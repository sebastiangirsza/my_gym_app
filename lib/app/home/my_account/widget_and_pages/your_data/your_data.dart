import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_gym_app/app/home/my_account/widget_and_pages/your_data/cubit/your_data_cubit.dart';
import 'package:my_gym_app/repositories/data_repository.dart';

class DataPageContent extends StatefulWidget {
  const DataPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DataPageContent> createState() => _DataPageContentState();
}

class _DataPageContentState extends State<DataPageContent> {
  String? _yourName;
  DateTime? _yourDate;
  String? _yourHeight;
  DateTime? _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(DataRepository()),
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
                        onPressed: _yourName == null ||
                                _yourDate == null ||
                                _yourHeight == null
                            ? null
                            : () {
                                context.read<DataCubit>().addData(
                                      _yourName!,
                                      _yourDate!,
                                      _yourHeight!,
                                      _date!,
                                    );
                              },
                        icon: const Icon(Icons.check))
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: _DataPageBody(
                  onYourNameChanged: (newValue) {
                    setState(() {
                      _yourName = newValue;
                    });
                  },
                  onYourDateChanged: (newValue) {
                    setState(() {
                      _yourDate = newValue;
                    });
                  },
                  onYourHeightChanged: (newValue) {
                    setState(() {
                      _yourHeight = newValue;
                    });
                  },
                  onDateChanged: (newValue) {
                    setState(() {
                      _date = newValue;
                    });
                  },
                  selectedYourDateFormatted: _yourDate == null
                      ? null
                      : DateFormat('dd/MM/yyyy').format(_yourDate!),
                  selectedDateFormatted: _date == null
                      ? null
                      : DateFormat('dd/MM/yyyy').format(_date!),
                ));
          },
        ),
      ),
    );
  }
}

class _DataPageBody extends StatelessWidget {
  const _DataPageBody({
    Key? key,
    required this.onYourNameChanged,
    required this.onYourDateChanged,
    required this.onYourHeightChanged,
    required this.onDateChanged,
    this.selectedDateFormatted,
    this.selectedYourDateFormatted,
  }) : super(key: key);

  final Function(String) onYourNameChanged;
  final Function(DateTime?) onYourDateChanged;
  final Function(String) onYourHeightChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;
  final String? selectedYourDateFormatted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
        ),
        height: 368,
        margin: const EdgeInsets.only(right: 25, left: 25),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
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
                              style: Theme.of(context).textTheme.bodyText1),
                          TextField(
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: const InputDecoration(
                              hintText: '',
                            ),
                            onChanged: onYourNameChanged,
                          ),
                          const SizedBox(height: 20),
                          Text('Data urodzenia',
                              style: Theme.of(context).textTheme.bodyText1),
                          ElevatedButton(
                            // decoration: const InputDecoration(
                            //   icon: Icon(Icons.calendar_month),
                            // ),
                            // readOnly: true,
                            onPressed: () async {
                              final selectedYourDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              onYourDateChanged(selectedYourDate);
                            },
                            child: Text(
                                selectedYourDateFormatted ?? 'Wybierz datę'),
                          ),
                          const SizedBox(height: 20),
                          Text('Wzrost',
                              style: Theme.of(context).textTheme.bodyText1),
                          TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: const InputDecoration(
                              hintText: '',
                            ),
                            onChanged: onYourHeightChanged,
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
    );
  }
}
