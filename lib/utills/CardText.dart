import 'package:flutter/material.dart';



class CardText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const CardText(
      {Key? key,
      this.text,
      this.fontSize = 14,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w300
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}