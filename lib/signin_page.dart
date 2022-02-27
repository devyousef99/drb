import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class signin_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: signin(),
    );
  }
}

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _loginApi() async {
    if(UserName.text.isNotEmpty && Password.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://10.0.2.2:8000/account/sign"), body: {
        'username': UserName.text,
        'password': Password.text,
      });
      if(response.statusCode==200){
        print("Welcome");
      } else {
        print("Wrong Data");
      }
    } else {
      print("wrong");
    }
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
                        controller: UserName,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'User Name',
                        ),
                        validator: Validators.compose([
                          Validators.required('Email address is required'),
                          Validators.email('Invalid email address')]),
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
                        controller: Password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                        ),
                        validator: Validators.compose([
                          Validators.required('Password is required')]),
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
                  child: Container(
                    height: 60.0,
                    width: 300.0,
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
