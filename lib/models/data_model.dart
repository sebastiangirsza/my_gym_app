import 'package:intl/intl.dart';

class DataModel {
  DataModel({
    required this.name,
    required this.date,
    required this.height,
    required this.saveDate,
  });

  final String name;
  final DateTime date;
  final int height;
  final DateTime saveDate;

  String dateFormatted() {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
