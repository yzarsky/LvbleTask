import 'package:intl/intl.dart';

extension StringUtils on String {

  String toDisplayDateFormat() {
    var dateFormat = DateFormat(DateFormat.NUM_MONTH_DAY); //YEAR_MONTH_DAY
    var date = dateFormat.format(DateTime.parse(this));
    return date.toString();
  }

  DateTime toDate() {
    // var dateFormat = DateFormat(DateFormat.NUM_MONTH_DAY); //YEAR_MONTH_DAY
    var date = DateTime.parse(this);
    return date;
  }
}

extension StringNullableUtils on String? {
  bool isStringEmpty() {
    return this == null || this!.isEmpty;
  }

  bool isStringNotEmpty() {
    return this != null && this!.isNotEmpty;
  }
}

extension DateTimeUtils on DateTime {

  String toPlanDateFormat() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    var date = dateFormat.format(this);
    return date.toString();
  }
}

extension ListUtils on List? {
  bool isListEmpty() {
    return this == null || this!.isEmpty;
  }

  bool isListNotEmpty() {
    return this != null && this!.isNotEmpty;
  }
}
