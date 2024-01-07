import 'package:intl/intl.dart' show NumberFormat;

class NumerFormat {
  static formatReal(double value) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(value);
  }

  static format(double value) {
    final format = NumberFormat('######.##');
    final formatReal = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    double valueF = double.parse(format.format(value));

    return formatReal.format(valueF);
  }
}
