import 'package:intl/intl.dart';


extension DateOnlyCompare on DateTime {
  bool isEqualDay(DateTime? dateTime) {
    if (dateTime == null) return false;
    return year == dateTime.year &&
        month == dateTime.month &&
        day == dateTime.day;
  }

  String formatTime() {
    return DateFormat('hh:mm').format(this);
  }

  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm').format(this);
  }
}
