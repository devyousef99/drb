// ignore_for_file: avoid_print, must_call_super, unused_element, use_key_in_widget_constructors

import 'dart:convert';
import 'dart:io';
import 'package:drb/Modules/clients.dart';
import 'package:drb/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;
import 'cart_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  int? id;
  late String mytest;
  var response;
  Clients? myresponse;
  final _formkey = GlobalKey<FormState>();

  Future<void> _loginApi() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      // mytest = response;
      // response = await http
      //     .post(Uri.parse("http://192.168.1.38:8000/account/sign"), body: {
      //   'username': username.text,
      //   'password': password.text,
      // }
      final response = await http.get(
        Uri.parse('https://drbdesignksa.daftra.com/api2/clients/'),
        headers: {
          'Authorization': '',
        },
      );
      myresponse = response as Clients?;
      if (response.statusCode == 200) {
        _formkey.currentState!.save();
        SharedPreferences shared = await SharedPreferences.getInstance();

        shared.setString('Users', json.decode(response.body).toString());
        print(shared.get('Users'));

        Get.to(CartPage());
      } else {
        print("Wrong Data");
      }
    } else {
      print("wrong");
    }
  }

  @override
  void initState() {
    _loginApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Form(
          key: _formkey,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                    right: 200.0,
                    left: 10.0,
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
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
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: username,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'User Name',
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
                  padding: const EdgeInsets.only(
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
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                        ),
                        validator: Validators.compose(
                            [Validators.required('Password is required')]),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 30.0,
                    left: 30.0,
                  ),
                  child: SizedBox(
                    height: 45.0,
                    width: 300.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: const Color.fromRGBO(110, 114, 253, 0.9),
                      onPressed: () {
                        // returns true if the form is valid or false.
                        _loginApi();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(
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
