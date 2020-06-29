import 'package:flutter/material.dart';

const kAppBarTitleTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 20.0,
  color: Colors.white,
  wordSpacing: 3.0,
  fontWeight: FontWeight.bold,
);
const kButtonTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 20.0,
  color: Colors.white,
);
const kPageHeadingTextStyle = TextStyle(
  fontFamily: 'SorceSansPro',
  fontSize: 40.0,
  color: Colors.teal,
  letterSpacing: 2.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
