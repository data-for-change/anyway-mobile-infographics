import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isSmallDevice(BuildContext context) =>
    MediaQuery.of(context).size.height < 750;

String removeSpecialChar(String text) {
  final RegExp alphaNumeric = RegExp(r'[^a-zA-Z0-9\s.,\u0590-\u05fe]');
  final String cleanString = text.replaceAll(alphaNumeric, '');
  return cleanString.trim();
}

String formattedDate(String date) {
  final DateTime tempDate = DateFormat('yyyy-MM-dd hh:mm:ss').parse(date);
  return DateFormat('dd-MM-yyyy').format(tempDate);
}
