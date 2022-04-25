// ignore_for_file: use_key_in_widget_constructors, avoid_print, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController host = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController location = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _registerApi() async {
    if (name.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        description.text.isNotEmpty &&
        host.text.isNotEmpty &&
        type.text.isNotEmpty &&
        date.text.isNotEmpty &&
        price.text.isNotEmpty &&
        date.text.isNotEmpty &&
        location.text.isNotEmpty) {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:8000/event/create"), body: {
        'ev_name': name.text,
        'ev_description': description.text,
        'ev_img': lastName.text,
        'ev_host': host.text,
        'ev_detail': [
          {
            'ev_type': type.text,
            'ev_price': price.text,
            'ev_date': date.text,
            'event_location': [
              {'ev_location_name': location.text}
            ]
          }
        ]
      });
      if (response.statusCode == 200) {
        print("Welcome");
      } else {}
    } else {
      print("wrong");
    }
  }

  final controller = GroupButtonController();
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
                top: 100.0,
                right: 30.0,
                left: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                        controller: name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: ' Name',
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
                        controller: description,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'description',
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
                        controller: host,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'host',
                        ),
                        validator: Validators.compose([
                          Validators.required('Email address is required'),
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      GroupButton(
                        controller: controller,
                        buttons: ['Price', 'Free'],
                        onSelected: (i, selected) =>
                            debugPrint('Button #$i $selected'),
                      ),
                      TextButton(
                        onPressed: () => controller.selectIndex(1),
                        child: const Text('Select 1 button'),
                      )
                    ],
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
                        controller: price,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'price',
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
                        controller: date,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'date',
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
                        controller: location,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'location',
                        ),
                        validator: Validators.compose([
                          Validators.required('location is required'),
                        ]),
                      ),
                    ),
                  ),
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
                        _registerApi();
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
