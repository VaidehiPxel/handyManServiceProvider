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

extension DateTimeExtensions on DateTime {
  String toFormattedTime() {
    // Convert the UTC date to local time.
    final localDate = toLocal();

    // Extract the hour and minute from the local date.
    final hour = localDate.hour;
    final minute = localDate.minute;

    // Determine whether it's AM or PM.
    final isAm = hour < 12;
    final meridian = isAm ? 'AM' : 'PM';

    // Format the hour using a 12-hour clock.
    final formattedHour = (hour % 12).toString();

    // Format the minute with leading zeros if necessary.
    final formattedMinute = minute.toString().padLeft(2, '0');

    // Combine the formatted hour, minute, and meridian into a single string.
    return '$formattedHour:$formattedMinute $meridian';
  }
}

