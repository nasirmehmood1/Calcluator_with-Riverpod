import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.buttonColour,
      required this.fontColour,
      required this.text,
      required this.ontap});
  final Color? buttonColour;
  final String text;
  final Color? fontColour;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height * 0.1,
        width: width * 0.2,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: buttonColour,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: 2, offset: Offset(-2, -2))
            ]),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: fontColour),
        ),
      ),
    );
  }
}
