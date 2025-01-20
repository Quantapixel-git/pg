import 'package:intl/intl.dart';

class DateTimeUtils {
  static final _dateFormater = DateFormat("d-MMMM-y");

  static String formatDate(DateTime date) => _dateFormater.format(date);
}
