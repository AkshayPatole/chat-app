
class FormatAmount {
  FormatAmount._();
  static String formatAmount(String? value, {int fractionalDigits = 2}) {
    if (value == null || value.isEmpty) return "0.${'0' * fractionalDigits}";

    final parsed = double.tryParse(value) ?? 0.0;
    String formatted = parsed.toStringAsFixed(fractionalDigits);
    List<String> parts = formatted.split('.');
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAllMapped(reg, (Match m) => '${m[1]},');
    
    return parts.join('.');
  }
}
