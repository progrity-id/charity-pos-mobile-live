import 'package:intl/intl.dart';

extension StringExtension on String {
  String toCurrencyFormatted({String? symbol}) {
    num value = num.parse(replaceAll(r'.00', ''));

    return NumberFormat.currency(locale: 'id', symbol: symbol ?? 'Rp ')
        .format(value)
        .replaceAll(RegExp(r',00'), '');
  }
}
