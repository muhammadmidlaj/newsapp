

import 'package:intl/intl.dart';

enum DateConvertionType {
  dayAndMonth, // feb 19
  dayMonthYear, // Feb 19 , 2024
  dayMonthYearAndTime, // feb 19, 2024 8:45 PM
  wDdayMonthYear, // Thu feb 18 2023
  monthYear,
  dayMonthWday, // 29 feb , mon
  weekDay, // mon
  day, // 18
  year, //2024
}

String convertDate(DateConvertionType type, DateTime date) {
  DateTime dateTime = date;
  switch (type) {
    case DateConvertionType.day:
      return DateFormat.d().format(dateTime);
    case DateConvertionType.dayAndMonth:
      return DateFormat.MMMd().format(dateTime);
    case DateConvertionType.weekDay:
      return DateFormat.E().format(dateTime);
    case DateConvertionType.dayMonthYear:
      return DateFormat.yMMMd().format(dateTime);
    case DateConvertionType.dayMonthYearAndTime:
      return DateFormat.yMMMd().add_jm().format(dateTime);
    case DateConvertionType.monthYear:
      return DateFormat.yMMM().format(dateTime);
    case DateConvertionType.wDdayMonthYear:
      return "${DateFormat.E().format(dateTime)},${DateFormat.yMMMd().format(dateTime)}";
    case DateConvertionType.dayMonthWday:
      return "${DateFormat.MMMd().format(dateTime)}, ${DateFormat.E().format(dateTime)}";

    default:
      return 'Invalid Format';
  }
}