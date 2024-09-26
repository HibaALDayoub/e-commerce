import 'package:intl/intl.dart';

class DateTimeHelper {
  static String timeFormat(DateTime dateTime) {
    return DateFormat('hh:mm aaa').format(dateTime);
  }

  static String dateFormat(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String difference(DateTime dateTime) {
    if (DateTime.now().difference(dateTime).inDays != 0) {
      return '${DateTime.now().difference(dateTime).inDays} days ago';
    } else {
      if (DateTime.now().difference(dateTime).inHours != 0) {
        return '${DateTime.now().difference(dateTime).inHours} hours ago';
      } else {
        if (DateTime.now().difference(dateTime).inMinutes != 0) {
          return '${DateTime.now().difference(dateTime).inMinutes} minutes ago';
        } else {
          return '${DateTime.now().difference(dateTime).inSeconds} seconds ago';
        }
      }
    }
  }
}
