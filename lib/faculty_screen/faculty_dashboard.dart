import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:provider/provider.dart';
import 'package:rait_online_portal/components/rounded_button.dart';
import 'package:rait_online_portal/states/currentUser.dart';
import 'package:rait_online_portal/common_screen/root.dart';

class FacultyDashboard extends StatefulWidget {
  @override
  FacultyDashboardState createState() => FacultyDashboardState();
}

class FacultyDashboardState extends State<FacultyDashboard> {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      label: 'FacultyDashboard',
      containerContent: Container(
        child: Center(
          child: RoundedButton(
            title: 'Logout',
            onPressed: () async {
              CurrentUser _currentUser =
                  Provider.of<CurrentUser>(context, listen: false);
              String _returnString = await _currentUser.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OurRoot()),
                  (route) => false);
            },
            colour: Colors.blue,
          ),
        ),
      ),
    );
  }
}
