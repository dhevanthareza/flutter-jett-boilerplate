import 'package:intl/intl.dart';

class StringUtils {
  static String getOrElse(String? text, String defaultValue) {
    return text != null && text != "" ? text : defaultValue;
  }

  static String toIdr(int number) {
    NumberFormat idrCurrency =
        new NumberFormat.simpleCurrency(locale: 'idr', decimalDigits: 0);
    return idrCurrency.format(number);
  }
}
