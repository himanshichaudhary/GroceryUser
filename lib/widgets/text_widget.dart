import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
   TextWidget({Key? key , required this.text ,required this.color,
    required this.fontSize,  this.isTitle = false , this.maxLines = 10 }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  bool isTitle;
  int maxLines = 10;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal
      ),
    );
  }
}
