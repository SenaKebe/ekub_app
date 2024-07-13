import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('MMM/dd/yyyy');
  return formatter.format(dateTime);
}

String formatDateTimeTwo(DateTime dateTime) {
  final DateFormat formatter = DateFormat('MMM/yyyy');
  return formatter.format(dateTime);
}
