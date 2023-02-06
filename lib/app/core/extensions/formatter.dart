import 'package:intl/intl.dart';

extension ExtensionName on double {
  String get currencyPtBr {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    return currencyFormat.format(this);
  }
}
