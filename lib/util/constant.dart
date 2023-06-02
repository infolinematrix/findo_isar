import 'package:flutter/material.dart';

TextStyle inputStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

double inputHeight = 50.0;

final txnMode = ['CASH', 'BANK'];

final dateFormat = ['dd-MM-yyyy', 'MM-dd-yyyy', 'yyyy-MM-dd'];
final currencyFormat = ['###,##0.00', '##,#0.00'];
final themes = ['LIGHT', 'DARK', 'SYSTEM'];
final List<Map<String, dynamic>> currencies = [
  {'code': 'rupee', 'name': 'Indian Rupees', 'symbol': '₹'},
  {'code': 'lira', 'name': 'Turkish lira', 'symbol': '₺'},
  {'code': 'pound', 'name': 'Pound', 'symbol': "£"},
  {'code': 'doller', 'name': 'US Doller', 'symbol': "\$"},
  {'code': 'yen', 'name': 'Yen', 'symbol': "¥"},
  {'code': 'franc', 'name': 'French franc', 'symbol': "₣"},
  {'code': 'peso', 'name': 'Peso', 'symbol': "₱"},
  {'code': 'ruble', 'name': 'Ruble', 'symbol': "₽"},
];

final yesNo = [
  {'key': true, 'value': 'Yes'},
  {'key': false, 'value': 'No'}
];

final List<Map<String, dynamic>> languages = [
  {'code': 'eng', 'value': 'English'},
  {'code': 'hindi', 'value': 'Hindi'}
];

final List randomColor = [
  0xFFffebee,
  0xFFfce4ec,
  0xFFf3e5f5,
  0xFFede7f6,
  0xFFe8eaf6,
  0xFFe3f2fd,
  0xFFe1f5fe,
  0xFFe0f7fa,
  0xFFe0f2f1,
  0xFFe8f5e9,
  0xFFf1f8e9,
  0xFFf9fbe7,
  0xFFfffde7,
  0xFFfff8e1,
  0xFFfff3e0,
  0xFFfbe9e7,
  0xFFefebe9,
  0xFFfafafa,
  0xFFeceff1,
];
