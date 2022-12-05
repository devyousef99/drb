import 'dart:convert';

import 'package:drb/Modules/clients.dart';
import 'package:drb/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late Future<Clients> clients;

  // Future<void> _RegisterApi() async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   var data = shared.getString('Users');
  //   var response =
  //       await http.get(Uri.parse("http://192.168.1.38:8000/account/${data}"));
  //   if (response.statusCode == 200) {
  //     print("Welcome");
  //   } else {
  //     print("wrong");
  //   }
  // }

  String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  Future<Clients> _clients() async {
    final response = await http.get(
        Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
        headers: {
          'APIKEY': token,
          'Cookie':
              'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
        });
    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);
      return Clients.fromJson(jsonresponse);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    clients = _clients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Get.back();
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          color: const Color(0xfff4f489e),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 200.0,
              right: 30.0,
              left: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
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
                          controller: userName,
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
                          controller: userName,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
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
                      // controller: lastName,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
