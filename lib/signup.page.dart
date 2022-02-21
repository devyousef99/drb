import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wc_form_validators/wc_form_validators.dart';


class signup_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: signup(),
    );
  }
}

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Form(
          key: _formkey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                    right: 200.0,
                    left: 10.0,
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: firstName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'First Name',
                        ),
                        validator: Validators.compose([
                          Validators.required('First name is required'),
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: lastName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Last Name',
                        ),
                        validator: Validators.compose([
                          Validators.required('Last name is required'),
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Email Address',
                        ),
                        validator: Validators.compose([
                          Validators.required('Email address is required'),
                          Validators.email('Invalid email address')
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                        ),
                        validator: Validators.compose([
                          Validators.required('Password is required')]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: Container(
                    height: 60.0,
                    width: 300.0,
                    child: RaisedButton(
                      color: Color.fromRGBO(110, 114, 253, 0.9),
                      onPressed: () {
                        // returns true if the form is valid or false.
                        if (_formkey.currentState.validate()) {
                          // if the form is valid display a snackbar.
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data!')));
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: Color.fromRGBO(110, 114, 253, 0.9),
                        ),
                      ),
                    ),
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
