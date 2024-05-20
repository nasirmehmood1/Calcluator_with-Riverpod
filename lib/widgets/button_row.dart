import 'package:flutter/material.dart';
import 'package:flutter_calcluator_riverpod/provider/provider.dart';
import 'package:flutter_calcluator_riverpod/widgets/button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonRow extends ConsumerWidget {
  const ButtonRow(
      {super.key,
      required this.first,
      required this.second,
      required this.third,
      required this.fourth});
  final String first;
  final String second;
  final String third;
  final String fourth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTap(String buttonText) {
      final calcluator = ref.read(calcluatorProvider.notifier);
      switch (buttonText) {
        case 'AC':
          calcluator.reset();
          break;
        case 'del':
          calcluator.delete();
          break;
        case '=':
          calcluator.equals();
          calcluator.resetEquation();
          break;
        default:
          calcluator.append(buttonText);
      }
    }

    final buttonRow = [first, second, third, fourth];
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonRow
            .map((text) => ButtonWidget(
                buttonColour: Colors.black54,
                fontColour: Colors.white,
                text: text,
                ontap: () {
                  onTap(text);
                }))
            .toList(),
      ),
    );
  }
}
