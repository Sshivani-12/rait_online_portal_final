import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/currentUser.dart';
import 'common_screen/root.dart';
import 'common_screen/login_screen.dart';
import 'student_screens/student_signup_screen.dart';
import 'faculty_screen/faculty_signup_screen.dart';
import 'student_screens/student_dashboard.dart';
import 'faculty_screen/faculty_dashboard.dart';

void main() => runApp(RaitOnline());

class RaitOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentUser(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => OurRoot(),
          '/login_screen': (context) => LoginScreen(),
          '/student_signup': (context) => StudentSignUpScreen(),
          '/faculty_signup': (context) => FacultySignUpScreen(),
          '/student_dashboard': (context) => StudentDashboard(),
          '/faculty_dashboard': (context) => FacultyDashboard(),
        },
      ),
    );
  }
}
