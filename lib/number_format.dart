import 'package:intl/intl.dart';

String numberFormat(int num) {
  return (num == 0) ? '무료' : '${NumberFormat('#,###').format(num)} 원';
}