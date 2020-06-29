import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FacultySignUpScreen extends StatefulWidget {
  @override
  _FacultySignUpScreenState createState() => _FacultySignUpScreenState();
}

class _FacultySignUpScreenState extends State<FacultySignUpScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String sdrn;
  String password;
  String adminkey;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Enter name'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter email'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        sdrn = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter SDRN no'),
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
                          hintText: 'Enter password'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        adminkey = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter admin key'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                      title: 'Sign Up',
                      onPressed: () async {
                        if (adminkey == 'admin') {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (newUser != null) {
                              await _firestore
                                  .collection('Faculty_User_Details')
                                  .add({
                                'email': email,
                                'name': name,
                                'sdrn': sdrn,
                                'password': password
                              });
                              Navigator.popAndPushNamed(
                                  context, '/faculty_dashboard');
                              print(
                                'sign up done',
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
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
    );
  }
}
