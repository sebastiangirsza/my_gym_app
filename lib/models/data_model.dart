import 'package:flutter/material.dart';

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
}
