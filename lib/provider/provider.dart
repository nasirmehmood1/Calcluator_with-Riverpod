import 'package:flutter_calcluator_riverpod/model/calcluator.dart';
import 'package:flutter_calcluator_riverpod/provider/calcluator_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calcluatorProvider =
    StateNotifierProvider<CalcluatorNotifier, Calculator>((ref) {
  return CalcluatorNotifier();
});
