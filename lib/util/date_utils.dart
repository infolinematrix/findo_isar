//--
import 'package:intl/intl.dart';

List<String> monthsShortUpercase = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JULY',
  'AUG',
  'SEPT',
  'OCT',
  'NOV',
  'DEC'
];

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

Map<String, dynamic> dateMap(DateTime dt) {
  final data = {
    'day': dt.day.toString(),
    'month': monthsShortUpercase[dt.month - 1],
    'year': dt.year.toString()
  };
  return data;
}

String formatDate(String dt) {
  if (dt == "null") return "Date Error";

  DateTime parseDt = DateTime.parse(dt);

  String dateSlug =
      "${parseDt.day.toString().padLeft(2, '0')}-${parseDt.month.toString().padLeft(2, '0')}-${parseDt.year.toString()}";

  return dateSlug;
}

String strToDate(DateTime dt) {
  // DateTime tempDate = DateTime.now();
  DateTime tempDate = dt;

  var suffix = "th";
  var digit = tempDate.day % 10;
  if ((digit > 0 && digit < 4) && (tempDate.day < 11 || tempDate.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }

  String d =
      "${tempDate.day}$suffix ${months[tempDate.month - 1]}, ${tempDate.year}";

  return d;
}

String strToMonth(DateTime dt) {
  DateTime tempDate = dt;

  String d = "${monthsShortUpercase[tempDate.month - 1]}, ${tempDate.year}";

  return d;
}

String strToShortDate(String dt) {
  DateTime tempDate = DateTime.now();

  var suffix = "th";
  var digit = tempDate.day % 10;
  if ((digit > 0 && digit < 4) && (tempDate.day < 11 || tempDate.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }
  String d =
      "${tempDate.day}$suffix-${monthsShortUpercase[tempDate.month - 1]}-${tempDate.year}";

  return d;
}

String strToShortMonth(DateTime dt) {
  String d = monthsShortUpercase[dt.month - 1];

  return d;
}

String strToDay(DateTime dt) {
  String d = "${dt.day}";

  return d;
}

String strToYear(DateTime dt) {
  String d = "${dt.year}";

  return d;
}

String strToWeekDay(DateTime dt) {
  // DateTime tempDate = DateTime.now();

  List<String> dayOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesdday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String d = dayOfWeek[dt.weekday];

  return d;
}

DateTime convertDateToLocal(String strDate) {
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(strDate, true);
  var dateLocal = dateTime.toLocal();

  return dateLocal;
}

DateTime dateTodayStart() {
  final now = DateTime.now().toUtc();
  final lastMidnight = now.subtract(Duration(
    hours: now.hour,
    minutes: now.minute,
    seconds: now.second,
    milliseconds: now.millisecond,
    microseconds: now.microsecond,
  ));

  return lastMidnight;
}

DateTime firstDayOfWeek() {
  DateTime now = DateTime.now().toUtc().toLocal();
  int currentDay = now.weekday;
  DateTime firstDayOfWeek = now.subtract(Duration(days: currentDay - 1));
  return firstDayOfWeek;
}

DateTime lastDayOfWeek() {
  DateTime now = DateTime.now().toUtc().toLocal();
  DateTime firstDayOfWeek =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
  return firstDayOfWeek;
}

DateTime firstDayOfMonth(DateTime dt) {
  final a = DateTime(dt.year, dt.month, 1);
  return a;
}

DateTime lastDayOfMonth(DateTime dt) {
  final a = DateTime(dt.year, dt.month + 1, 0);
  return a;
}

DateTime firstDayOfYear() {
  DateTime now = DateTime.now().toUtc();
  return DateTime(now.year, 1, 1);
}

DateTime lastDayOfYear() {
  DateTime now = DateTime.now().toUtc();
  return DateTime(now.year, 12, 31);
}
