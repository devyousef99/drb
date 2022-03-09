import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

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
  TextEditingController UserName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _RegisterApi() async {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        UserName.text.isNotEmpty) {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:8000/account/register"), body: {
        'username': UserName.text,
        'first_name': firstName.text,
        'last_name': lastName.text,
        'email': email.text,
        'password': password.text
      });
      if (response.statusCode == 200) {
        print("Welcome");
      } else {}
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 150.0,
                right: 30.0,
                left: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
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
                        controller: UserName,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'User Name',
                        ),
                        validator: Validators.compose([
                          Validators.required('First name is required'),
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
                        validator: Validators.compose(
                            [Validators.required('Password is required')]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    GroupButton(
                      isRadio: true,
                      buttonWidth: 45,
                      borderRadius: BorderRadius.circular(5),
                      selectedColor: const Color.fromRGBO(110, 114, 253, 0.9),
                      elevation: 3,
                      spacing: 50,
                      onSelected: (index, isSelected) =>
                          print('$index button is selected'),
                      buttons: const [
                        "User",
                        "Designer",
                      ],
                    ),
                  ]),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    width: 300.0,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: const Color.fromRGBO(110, 114, 253, 0.9),
                      onPressed: () {
                        // returns true if the form is valid or false.
                        // if the form is valid display a snackbar.
                        _RegisterApi();
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
      ),
    );
  }
}