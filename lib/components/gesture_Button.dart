import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';

class GestureButton extends StatelessWidget {
  GestureButton({@required this.label, @required this.onTap});
  final Function onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.teal,
        child: Center(
          child: Text(
            label,
            style: kButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(
          left: 50.0,
          right: 50.0,
        ),
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
      ),
    );
  }
}
