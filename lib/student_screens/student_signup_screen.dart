import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/components/rounded_button.dart';
import 'package:rait_online_portal/components/dropdown_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentSignUpScreen extends StatefulWidget {
  @override
  _StudentSignUpScreenState createState() => _StudentSignUpScreenState();
}

class _StudentSignUpScreenState extends State<StudentSignUpScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String rollno;
  String year;
  String div;
  int batch;
  int optionalsubject;
  String password;

  String selectedYear;
  int selectedBatch;
  String selectedDiv;
  int selectedOptionalSubject;
  bool checkBoxValue = false;
  dynamic i;

  List<DropdownMenuItem> getDropDownItems(List dropdownList) {
    List<DropdownMenuItem> dropDownItems = [];

    for (i in dropdownList) {
      var newItem = DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

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
                          kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
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
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        rollno = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter roll no.'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Year',
                                    ),
                                    SizedBox(
                                      width: 13.0,
                                    ),
                                    DropdownButton(
                                        iconEnabledColor: Colors.blue,
                                        value: selectedYear,
                                        items: getDropDownItems(YearList),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedYear = value;
                                            year = value;
                                          });
                                        }),
                                    SizedBox(
                                      width: 70.0,
                                    ),
                                    Text(
                                      'Division',
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    DropdownButton(
                                        iconEnabledColor: Colors.blue,
                                        value: selectedDiv,
                                        items: getDropDownItems(DivisonList),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDiv = value;
                                            div = value;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Batch',
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    DropdownButton(
                                        iconEnabledColor: Colors.blue,
                                        value: selectedBatch,
                                        items: getDropDownItems(BatchList),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedBatch = value;
                                            batch = value;
                                          });
                                        }),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      'Optional Subject',
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    DropdownButton(
                                        iconEnabledColor: Colors.blue,
                                        value: selectedOptionalSubject,
                                        items: getDropDownItems(
                                            OptionalSubjectList),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptionalSubject = value;
                                            optionalsubject = value;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Create password'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                      title: 'Sign Up',
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          if (newUser != null) {
                            await _firestore
                                .collection('Student_User_Details')
                                .add({
                              'email': email,
                              'name': name,
                              'roll_no': rollno,
                              'year': year,
                              'div': div,
                              'batch': batch,
                              'optional_subject': optionalsubject,
                              'password': password
                            });
                            Navigator.popAndPushNamed(
                                context, '/student_dashboard');
                          }
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
    );
  }
}
