
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget{
  final Widget text;
  final Function() onPressed;
  final Color color;
  final double size;

  const MainButton({Key? key, 
  required this.text, 
  required this.onPressed, 
  required this.color, 
  required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size.fromHeight(size),
      ),
      child: text,
      onPressed: onPressed,
      );
  }
}