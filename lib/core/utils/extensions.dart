extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}

extension DoubleExtensions on double {
  String toRatingString() {
    return toStringAsFixed(1);
  }
}

extension DateTimeExtensions on DateTime {
  String toYearString() {
    return year.toString();
  }

  String toFormattedString() {
    return '$day/${month.toString().padLeft(2, '0')}/$year';
  }
}

extension ListExtensions<T> on List<T> {
  List<T> safeSublist(int start, [int? end]) {
    if (isEmpty) return [];
    final safeStart = start.clamp(0, length);
    final safeEnd = (end ?? length).clamp(safeStart, length);
    return sublist(safeStart, safeEnd);
  }
}
