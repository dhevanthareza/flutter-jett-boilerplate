import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateUtils {
  static String format(String format, DateTime date) {
    initializeDateFormatting("id");
    Intl.defaultLocale = "id";
    return DateFormat(format).format(date);
  }

  static String formatFromString(String? tanggal, {String? format = "yMMMMd"}) {
    if (tanggal != null && tanggal != "" && tanggal != "null") {
      DateTime date = DateTime.parse(tanggal.toString());
      return DateUtils.format(format!, date);
    } else {
      return "-";
    }
  }
}
