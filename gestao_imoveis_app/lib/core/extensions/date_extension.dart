import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toBrDate() => DateFormat('dd/MM/yyyy').format(this);
  String toShortDate() => DateFormat('dd/MM/yy').format(this);
  String toMonthYear() => DateFormat('MM/yyyy').format(this);
  String toFullBrDate() => DateFormat("dd 'de' MMMM 'de' yyyy", 'pt_BR').format(this);
  String toTimeString() => DateFormat('HH:mm').format(this);

  bool get isOverdue => isBefore(DateTime.now());

  int get daysUntil => difference(DateTime.now()).inDays;
  int get daysOverdue => DateTime.now().difference(this).inDays;
}
