import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool checkBoxValue = false;
  String email;
  String password;
  bool showSpinner = false;

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      height: 300.0,
      padding: EdgeInsets.all(
        60.0,
      ),
      child: Column(
        children: <Widget>[
          RoundedButton(
            title: 'Student Sign Up',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/student_signup',
              );
            },
            colour: Colors.blue,
          ),
          RoundedButton(
            title: 'Faculty Sign Up',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/faculty_signup',
              );
            },
            colour: Colors.blue,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'images/RAIT_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    25.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email'),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            // print('hello');
                          },
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New member?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                // print('hello');
                                showModalBottomSheet(
                                  context: context,
                                  builder: buildBottomSheet,
                                );
                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: checkBoxValue,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValue = newValue;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              'Are you a faculty?',
                              style: TextStyle(
                                color: checkBoxValue
                                    ? Colors.black
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RoundedButton(
                        title: 'Login',
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (user != null) {
                              print('login done');
                              if (checkBoxValue == true) {
                                Navigator.pushNamed(
                                    context, '/faculty_dashboard');
                              } else {
                                Navigator.pushNamed(
                                    context, '/student_dashboard');
                              }
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        colour: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
