import 'package:intl/intl.dart';

final currencySymbolFormat = NumberFormat.currency(
  locale: 'en_GB',
  symbol: "£",
  decimalDigits: 2,
);

// extension DoubleHelper on double? {
//   String formatCurrency() {
//     return currencySymbolFormat.format(this ?? 0);
//   }
// }

extension StringHelper on String? {
  String formatCurrency() {
    return currencySymbolFormat.format(this ?? "0");
  }
}

extension DateTimeHelper on DateTime {
  String formatDate() {
    String defaultFormat = 'dd MMM';
    return DateFormat(defaultFormat).format(this).toString();
  }
}
