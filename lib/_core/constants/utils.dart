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
    String defaultValue = "";
    String defaultFormat = 'dd/MM/yyyy';
    if (this != null) {
      return DateFormat(defaultFormat).format(this!).toString();
    } else {
      return defaultValue;
    }
  }
}
