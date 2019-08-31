import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final double radius;
  final VoidCallback onPressed;
  final double elevation;

  GradientButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.gradient,
    this.height = 50,
    this.width = double.infinity,
    this.elevation = 1.0,
    this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      child: Material(
        type: MaterialType.transparency,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: elevation,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
