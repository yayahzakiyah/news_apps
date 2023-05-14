import 'package:intl/intl.dart';

class MyDateFormat {
  String dateFormat(String formatD) {
    final now = DateTime.now();
    String formatter = DateFormat(formatD).format(now);
    return formatter;
  }

  String dateLater(String formatD, days) {
    DateTime currentDate = DateTime.now();
    DateTime daysLater = currentDate.subtract(Duration(days: days));
    String formattedDate = DateFormat(formatD).format(daysLater);
    return formattedDate;
  }

  String calculateDifferentTime(String? dateNews) {
    DateTime givenDateTime = DateTime.parse(dateNews!);
    DateTime now = DateTime.now();
    Duration difference = now.difference(givenDateTime);
    int differenceInMinutes = difference.inMinutes;
    int differenceInHours = differenceInMinutes ~/ 60;
    int differenceInDays = differenceInHours ~/ 24;
    String result;
    if (differenceInHours >= 1) {
      if (differenceInHours >= 24) {
        differenceInDays = differenceInHours ~/ 24;
        result = '${differenceInDays}d ago';
        return result;
      } else {
        result = '${differenceInHours}h ago';
        return result;
      }
    } else {
      result = '${differenceInMinutes}m ago';
      return result;
    }
  }
}
