import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.text,
    required this.color,
    required this.myonpressed,
  });

  final Color color;
  final String text;
  final void Function()? myonpressed; // Good
  //final VoidCallback? myonPressed;
  //final Function myonpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: myonpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
