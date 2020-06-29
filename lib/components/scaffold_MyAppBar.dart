import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({@required this.label, @required this.containerContent});
  final String label;
  final Container containerContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'images/RAIT_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: kAppBarTitleTextStyle,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: containerContent,
      ),
    );
  }
}
