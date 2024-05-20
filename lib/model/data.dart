class Data {
  static bool isOperator(String buttonText, {bool hasEquals = false}) {
    final operators = [
      '+',
      '-',
      '÷',
      'X',
      '.',
      if (hasEquals) ...['=']
    ];

    return operators.contains(buttonText);
  }

  static bool isOperatorAtEnd(String equation) {
    if (equation.isNotEmpty) {
      return Data.isOperator(equation.substring(equation.length - 1));
    } else {
      return false;
    }
  }
}
