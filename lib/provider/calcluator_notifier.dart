import 'dart:math';

import 'package:flutter_calcluator_riverpod/model/calcluator.dart';
import 'package:flutter_calcluator_riverpod/model/data.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcluatorNotifier extends StateNotifier<Calculator> {
  CalcluatorNotifier() : super(const Calculator());

  void delete() {
    final equation = state.equation;

    if (equation.isNotEmpty) {
      final newEquation = equation.substring(0, equation.length - 1);

      if (newEquation.isEmpty) {
        reset();
      } else {
        state = state.copyWith(equation: newEquation);
        calculate();
      }
    }
  }

  void reset() {
    const equation = '0';
    const result = '0';
    state = state.copyWith(equation: equation, result: result);
  }

  void resetEquation() {
    const equation = '0';
    state = state.copyWith(equation: equation);
  }

  void resetResult() {
    final equation = state.result;

    state = state.copyWith(
      equation: equation,
      shouldAppend: false,
    );
  }

  void append(String buttonText) {
    final equation = () {
      if (Data.isOperator(buttonText) && Data.isOperatorAtEnd(state.equation)) {
        final newEquation =
            state.equation.substring(0, state.equation.length - 1);

        return newEquation + buttonText;
      } else if (state.shouldAppend) {
        return state.equation == '0' ? buttonText : state.equation + buttonText;
      } else {
        return Data.isOperator(buttonText)
            ? state.equation + buttonText
            : buttonText;
      }
    }();

    state = state.copyWith(equation: equation, shouldAppend: true);
    calculate();
  }

  void equals() {
    calculate();
    resetResult();
  }

  void calculate() {
    final expression = state.equation.replaceAll('X', '*').replaceAll('÷', '/');

    try {
      final exp = Parser().parse(expression);
      final model = ContextModel();

      final result = '${exp.evaluate(EvaluationType.REAL, model)}';
      state = state.copyWith(result: result);
    } catch (e) {}
  }
}
