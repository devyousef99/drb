// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:drb/store_page.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

// class ApiClient {
//   final Dio _dio = Dio();
//   Future<Response> login(String email, String password) async {
//     try {
//       Response response = await _dio.post(
//         'https://drbdesignksa.daftra.com/api2/clients',
//         data: {'email': email, 'password': password},
//         queryParameters: {'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4'},
//       );
//       //returns the successful user data json object
//       return response.data;
//     } on DioError catch (e) {
//       //returns the error object if any
//       return e.response!.data;
//     }
//   }

//   Future<Response> getUserProfileData(String accesstoken) async {
//     try {
//       Response response = await _dio.get(
//         'https://drbdesignksa.daftra.com/api2/clients',
//         queryParameters: {'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4'},
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
//             'Cookie':
//                 'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
//           },
//         ),
//       );
//       return response.data;
//     } on DioError catch (e) {
//       return e.response!.data;
//     }
//   }
// }

class SignInState extends State<SignIn> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool visible = false;

  Future<void> signin() async {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
          headers: {
            'Content-Type': 'application/json',
            'APIKEY': '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4',
            // 'Cookie':
            //     'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
          },
          body: jsonEncode({'email': _email.text, 'password': _password.text}));
      if (response.statusCode == 200 && response.statusCode == 202) {
        var jsonresponse = response.body;
        print(jsonresponse);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Store()));
      } else {
        var jsonresponse = response.body;
        print(jsonresponse);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login failed')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }

  // Future<Client?> _loginApi(String email, String password) async {
  //   final body = jsonEncode({'email': email, 'password': password});
  //   if (email.isNotEmpty && password.isNotEmpty) {
  //     String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  //     var response = await http
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
  //   return Client(email: email, password: password);
  // }

// Yousef
  // Future<Client> _loginApi() async {
  //   if (email.text.isNotEmpty && password.text.isNotEmpty) {
  //     // mytest = response;
  //     // response = await http
  //     //     .post(Uri.parse("http://192.168.1.38:8000/account/sign"), body: {
  //     //   'username': username.text,
  //     //   'password': password.text,
  //     // }
  //     String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  //     final response = await http.get(
  //         Uri.parse('https://drbdesignksa.daftra.com/api2/clients'),
  //         headers: {
  //           'APIKEY': token,
  //           'Cookie':
  //               'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
  //         });
  //     if (response.statusCode == 200) {
  //       var jsonresponse = jsonDecode(response.body);
  //       print(jsonresponse);
  //       return Client.fromJson(jsonresponse);
  //     } else {
  //       throw Exception(response.body);
  //     }

  //     // myresponse = response as Clients?;
  //     // if (response.statusCode == 200) {
  //     //   _formkey.currentState!.save();
  //     //   SharedPreferences shared = await SharedPreferences.getInstance();

  //     //   shared.setString('Users', json.decode(response.body).toString());
  //     //   print(shared.get('Users'));
  //     // } else {
  //     //   print("Wrong Data");
  //     // }
  //   } else {
  //     print("wrong");
  //   }
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
              image: AssetImage('assets/background.png'), fit: BoxFit.fill),
        ),
        child: Form(
          key: _formkey,
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
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (_email.text.isEmpty) {
                          Validators.required('Email address is required');
                        } else if (!emailValidatorRegExp
                            .hasMatch(_email.text)) {
                          Validators.email('Invalid email address');
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        Validators.required('Password is required');
                        if (_password.text.isEmpty) {
                          return 'Please enter your password.';
                          // } else if (_password.text.length < 8) {
                          //   return 'Password must be 8 characters or more.';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onPressed: () {
                      signin();
                    },
                    // onPressed: () async {
                    //   if (_formkey.currentState!.validate()) {
                    //     //show snackbar to indicate loading
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: const Text('Processing Data'),
                    //       backgroundColor: Colors.green.shade300,
                    //     ));
                    //     //get response from ApiClient
                    //     // _loginApi(
                    //     //   _email.text,
                    //     //   _password.text,
                    //     // );
                    //   }
                    // final isValid = _formkey.currentState!.validate();
                    // if (isValid) {
                    //   _formkey.currentState!.save();
                    //   _loginApi(_email.text, _password.text);
                    //   Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Store(),
                    //       ),
                    //       (route) => false);
                    //   print('sign in successfully');
                    // }
                    // },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
