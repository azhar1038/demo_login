import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final EdgeInsetsGeometry outerPadding;
  final EdgeInsetsGeometry innerPadding;
  final double topRightRadius;
  final double elevation;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Function onSaved;
  final Function validator;

  FormInputField({
    @required this.hintText,
    @required this.onSaved,
    @required this.validator,
    this.outerPadding = const EdgeInsets.only(right: 40, bottom: 20),
    this.innerPadding = const EdgeInsets.only(left: 40, right: 10, bottom: 5),
    this.obscureText = false,
    this.topRightRadius = 20.0,
    this.elevation = 10.0,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        child: Material(
          elevation: elevation,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRightRadius),
            ),
          ),
          child: Padding(
            padding: innerPadding,
            child: TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xffe1e1e1),
                  fontSize: 16,
                ),
              ),
              keyboardType: keyboardType,
              onSaved: onSaved,
              validator: validator,
            ),
          ),
        ),
      ),
    );
  }
}
