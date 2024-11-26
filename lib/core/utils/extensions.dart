import 'package:intl/intl.dart';

extension NumberFormats on num? {
  String formatAmount() {
    if (this == null) return '\$${0.00}';
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return '\$${formatter.format(this)}';
  }
}

extension DateFormating on DateTime? {
  String formatDate() {
    if (this == null) return '';
    final now = DateTime.now();
    if (this!.year == now.year &&
        this!.month == now.month &&
        this!.day == now.day) {
      return 'Hoy';
    } else if (this!.year == now.year &&
        this!.month == now.month &&
        this!.day == now.day + 1) {
      return 'Mañana';
    } else {
      final formatter = DateFormat('dd MMM yyyy');
      return formatter.format(this!);
    }
  }
}
