import 'package:intl/intl.dart';

formatCurrency(String amount) {
  var formatter = NumberFormat('##,##,##,##0.00');
  double u = double.parse(amount).toDouble();
  final out = formatter.format(u);
  return out;
}
