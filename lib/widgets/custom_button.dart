import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.tittle,
    required this.onPressed,
    this.color,
    this.animationController,
  });

  final String tittle;
  final Color? color;
  final Function() onPressed;
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: animationController != null
            ? 100 - animationController!.value * 100
            : 0.0,
        vertical: 16.0,
      ),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            tittle,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
