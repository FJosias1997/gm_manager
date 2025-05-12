import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatBRNoHour => DateFormat('dd/MM/yyyy').format(this);
}
