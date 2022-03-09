import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: profile(),
    );
  }
}

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // Future<void> _RegisterApi() async {
  //   if(firstName.text.isNotEmpty && lastName.text.isNotEmpty &&
  //       email.text.isNotEmpty && password.text.isNotEmpty &&
  //       UserName.text.isNotEmpty){
  //     var response = await http.post(Uri.parse("http://10.0.2.2:8000/account/register"), body: {
  //       'username': UserName.text,
  //       'first_name': firstName.text,
  //       'last_name': lastName.text,
  //       'email': email.text,
  //       'password': password.text
  //     });
  //     if(response.statusCode==200){
  //       print("Welcome");
  //     } else {
  //     }
  //   } else {
  //     print("wrong");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              right: 30.0,
              left: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/signin.jpeg'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 30.0,
                              left: 30.0,
                            ),
                            child: TextField(
                              controller: UserName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'First Name',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 30.0,
                              left: 30.0,
                            ),
                            child: TextField(
                              controller: UserName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Last Name',
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: TextFormField(
                      controller: firstName,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'First Name',
                      ),
                      validator: Validators.compose([
                        Validators.required('Last name is required'),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: TextFormField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Last Name',
                      ),
                      validator: Validators.compose([
                        Validators.required('Last name is required'),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
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
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
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
                      validator: Validators.compose([
                        Validators.required('Password is required')]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  // height: 65.0,
                  width: 300.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: const Color.fromRGBO(110, 114, 253, 0.9),
                    onPressed: () {
                    },
                    child: const Text(
                      'Sign up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}