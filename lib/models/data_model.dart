import 'package:intl/intl.dart';

class DataModel {
  DataModel({
    required this.yourName,
    required this.yourDate,
    required this.yourHeight,
    required this.date,
  });

  final String yourName;
  final DateTime yourDate;
  final String yourHeight;
  final DateTime date;

  String dateFormatted() {
    return DateFormat('dd/MM/yyyy').format(yourDate);
  }
}
