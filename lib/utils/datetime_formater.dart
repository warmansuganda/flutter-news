import 'package:intl/intl.dart';

class DateTimeFormater {
  static String diffForHumman(DateTime date) {
    DateTime now = DateTime.now();
    Duration duration = now.difference(date);

    if (duration.inDays >= 7) {
      return DateFormat('d MMM y').format(DateTime.now().add(duration));
    } else if (duration.inDays >= 1) {
      return '${duration.inDays}d ago';
    } else if (duration.inHours >= 1) {
      return '${duration.inHours}h ago';
    } else {
      return '${duration.inMinutes}m ago';
    }
  }
}
