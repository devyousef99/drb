// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:drb/store_page.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _user = GroupButtonController();
  final _formkey = GlobalKey<FormState>();
  bool passwordVisibile = true;
  bool confirmPasswordVisibile = true;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<void> signup() async {
    var body = json.encode({
      'first_name': _firstName.text,
      'last_name': _lastName.text,
      'email': _email.text,
      'password': _password.text
    });
    try {
      if (_firstName.text.isNotEmpty &&
          _lastName.text.isNotEmpty &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
            headers: {
              'Content-Type': 'application/json',
              'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
            },
            body: body);
        print(body);
        if (response.statusCode == 200 || response.statusCode == 202) {
          var jsonresponse = response.body;
          print('body: $body');
          print('successful: $jsonresponse');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Store()));
        } else {
          var jsonresponse = response.body;
          print('faild: $jsonresponse');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Signup failed')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error')));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<void> _registerApi(
  //     String firstName, String lastName, String email, String password) async {
  //   final body = jsonEncode({
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'email': email,
  //     'password': password
  //   });
  //   if (firstName.isNotEmpty &&
  //       lastName.isNotEmpty &&
  //       email.isNotEmpty &&
  //       password.isNotEmpty) {
  //     String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  //     response = await http
  //         .post(Uri.parse("https://drbdesignksa.daftra.com/api2/clients"),
  //             headers: {
  //               'Content-Type': 'application/json',
  //               'APIKEY': token,
  //               'Cookie':
  //                   'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
  //             },
  //             body: body)
  //         .then((response) {
  //       final result = jsonDecode(response.body) as Map<String, dynamic>;
  //       print(result);
  //     }).catchError((error) {
  //       print(error);
  //     });
  //   }
  // }

  // var jsonresponse;
  // Future<Client> _registerApi(
  //     String firstName, String lastName, String email, String password) async {
  //   try {
  //     if (firstName.isNotEmpty &&
  //         lastName.isNotEmpty &&
  //         email.isNotEmpty &&
  //         password.isNotEmpty) {
  //       final response = await http.post(
  //           Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
  //           headers: {
  //             'Content-Type': 'application/json',
  //             'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
  //             'Cookie':
  //                 'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
  //           },
  //           body: jsonEncode({
  //             'first_name': firstName,
  //             'last_name': lastName,
  //             'email': email,
  //             'password': password
  //           }));
  //       if (response.statusCode == 200) {
  //         jsonresponse = jsonDecode(response.body);
  //         // print(_firstName);
  //         // print(response.body);
  //         print('response.statusCode $response.statusCode');
  //         return Client.fromJson(jsonresponse);
  //       } else {
  //         print('jsonresponse $jsonresponse');
  //         throw Exception('Failed to load data');
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return Client.fromJson(jsonresponse);
  // }
  // var response;
  // Future<Client> _registerApi() async {
  //   try {
  //     response = await http.post(
  //       Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
  //         'Cookie':
  //             'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
  //       },
  //       body: jsonEncode({
  //         'first_name': _firstName,
  //         'last_name': _lastName.value,
  //         'email': _email.value,
  //         'password': _password.value
  //       }),
  //     );

  //     if (response.statusCode == 201) {
  //       // If the server did return a 201 CREATED response,
  //       // then parse the JSON.
  //       return Client.fromJson(json.decode(response.body));
  //     } else {
  //       // If the server did not return a 201 CREATED response,
  //       // then throw an exception.
  //       Error();
  //       throw Exception('Failed to create album.');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return Client.fromJson(response.body);
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 190),
          children: [
            Form(
              key: _formkey,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
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
                            controller: _firstName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'First Name',
                            ),
                            validator: (value) {
                              Validators.required('First name is required');
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
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
                            controller: _lastName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Last Name',
                            ),
                            validator: (value) {
                              Validators.required('Last name is required');
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
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
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (_email.text.isEmpty) {
                                Validators.required(
                                    'Email address is required');
                              } else if (!emailValidatorRegExp
                                  .hasMatch(_email.text)) {
                                Validators.email('Invalid email address');
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
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
                            controller: _password,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: passwordVisibile
                                    ? const Icon(Icons.visibility_off_rounded)
                                    : const Icon(Icons.visibility_rounded),
                                onPressed: (() => setState(() {
                                      passwordVisibile = !passwordVisibile;
                                    })),
                              ),
                            ),
                            obscureText: passwordVisibile,
                            validator: (value) {
                              if (_password.text.isEmpty) {
                                Validators.required(
                                    'Password address is required');
                              } else if (_password.text.length < 8) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
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
                            controller: _confirmPassword,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                icon: confirmPasswordVisibile
                                    ? const Icon(Icons.visibility_off_rounded)
                                    : const Icon(Icons.visibility_rounded),
                                onPressed: (() => setState(() {
                                      confirmPasswordVisibile =
                                          !confirmPasswordVisibile;
                                    })),
                              ),
                            ),
                            obscureText: confirmPasswordVisibile,
                            validator: (value) {
                              if (_confirmPassword.text.isEmpty) {
                                Validators.required(
                                    'Password address is required');
                              } else if (_confirmPassword.text !=
                                  _password.text) {
                                return 'Passwords don`t match!';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: GroupButton(
                        controller: _user,
                        buttons: const ['Designer', 'Client'],
                        onSelected: (i, index, isSelected) {
                          debugPrint('Button $i $isSelected');
                          print(_user.selectedIndex);
                        },
                        options: const GroupButtonOptions(
                          buttonHeight: 50,
                          buttonWidth: 100,
                          spacing: 20,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          selectedColor: Color.fromRGBO(110, 114, 253, 0.9),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        right: 30.0,
                        left: 30.0,
                      ),
                      child: SizedBox(
                        width: 350.0,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(110, 114, 253, 0.9),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          // returns true if the form is valid or false.
                          // onPressed: () async {
                          //   final isValid = _formkey.currentState!.validate();
                          //   if (isValid) {
                          //     _formkey.currentState!.save();
                          //     _registerApi(_firstName.text, _lastName.text,
                          //         _email.text, _password.text);
                          //     // Navigator.pushAndRemoveUntil(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //       builder: (context) =>  Store(),
                          //     //     ),
                          //     //     (route) => false);
                          //     print('account created successfully');
                          //   }
                          // },
                          onPressed: () async {
                            final isValid = _formkey.currentState!.validate();
                            if (isValid) {
                              _formkey.currentState!.save();
                              signup();
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>  Store(),
                              //     ),
                              //     (route) => false);
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
