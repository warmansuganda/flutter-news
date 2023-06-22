import 'package:intl/intl.dart';

class NumberFormater {
  static String currency(double number) {
    final format = NumberFormat('#,###');
    return format.format(number);
  }
}
