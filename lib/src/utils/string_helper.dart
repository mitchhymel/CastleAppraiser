
class StringHelper {

  static String getMonthDay(DateTime time) {
    return '${time.month}/${time.day}';
  }

  static String getMonthDayYear(DateTime time) {
    return '${time.month}/${time.day}/${time.year}';
  }
}