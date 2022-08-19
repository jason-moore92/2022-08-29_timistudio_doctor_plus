import 'package:intl/intl.dart';

enum Format { dMy, mmdy, mdy, dMydMy, my }

mixin FormatTime {
  static String formatTime({required Format format, DateTime? dateTime}) {
    final DateTime now = DateTime.now();
    final DateTime sevenDaysAgo = now.subtract(const Duration(days: 7));
    String formatted;
    DateFormat formatter;
    switch (format) {
      case Format.dMy:
        formatter = DateFormat('dd/MM/yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.mmdy:
        formatter = DateFormat('MMMM dd, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.mdy:
        formatter = DateFormat('MMM dd, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
      case Format.dMydMy:
        if (sevenDaysAgo.year == now.year) {
          formatter = DateFormat('dd MMM yyyy');
          formatted = DateFormat('dd MMM').format(sevenDaysAgo) +
              ' - ' +
              formatter.format(now);
        } else {
          formatter = DateFormat('dd MMM yyyy');
          formatted =
              formatter.format(sevenDaysAgo) + ' - ' + formatter.format(now);
        }
        break;
      case Format.my:
        formatter = DateFormat('MMM, yyyy');
        formatted = formatter.format(dateTime ?? now);
        break;
    }
    return formatted;
  }

  static String convertTime(int duration) {
    final minutesStr = (duration / 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
