import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toDateFormat() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String toYear() {
    return DateFormat('yyyy').format(this);
  }
}
