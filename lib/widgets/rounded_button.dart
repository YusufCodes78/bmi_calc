import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final TextStyle? btnStyle;
  final Color? bgColor;
  final VoidCallback? callback;

  const RoundedButton(
      {super.key,
      required this.btnText,
      this.bgColor = Colors.blue,
      this.callback,
      this.btnStyle});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            callback!();
          },
          style: ElevatedButton.styleFrom(backgroundColor: bgColor),
          child: Text(
            btnText,
            style: btnStyle,
          )),
    );
  }
}
