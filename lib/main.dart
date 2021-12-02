import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  //Global key created to handle a from validation
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 200.0,
                  left: 50.0,
                  right: 50.0),
              child: TextFormField(
                //Mail Field.
                validator: validateEmail,
                keyboardType:
                TextInputType.emailAddress,
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintText: 'mail',
                  hintStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'koliko',
                      color: Colors.grey.shade700,
                      letterSpacing: 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 50.0,
                  right: 50.0),
              child: TextFormField(
                //Mail Field.
                validator: validateEmail,
                keyboardType:
                TextInputType.emailAddress,
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'koliko',
                      color: Colors.grey.shade700,
                      letterSpacing: 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'forget passowrd',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey.shade700,
                      letterSpacing: 1.5,
                      fontSize: 15.0,
                      fontFamily: 'koliko'),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(40.0)),
                  color: Colors.black),
              child: MaterialButton(
                highlightColor: Colors.transparent,
                onPressed: _validateInput,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontFamily: 'koliko'),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child:Text(
                      'Dont Have Account?',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          fontFamily: 'koliko'),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'SignUP',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey.shade700,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          fontFamily: 'koliko'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _validateInput() {
    //If all data are correct then save data to out variables
    if (formkey.currentState.validate()) {
      print("Your Data Saved");
      //If all data are not valid then start auto validation.
    } else {
      SnackBar(content: Text('data'));
    }
  }
  //To validate Mail!
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'يرجى إدخال بريد الكتروني صحيح';
    else
      return null;
  }
  //To validate Mobile!
  String validateMobile(String value) {
    if (value.length != 10)
      return 'يرجى إدخال رقم جوال صحيح';
    else
      return null;
  }
}
