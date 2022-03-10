class StringUtils {
  static String getOrElse(String? text, String defaultValue) {
    return text != null && text != "" ? text : defaultValue;
  }
}