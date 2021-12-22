import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:credit_card_input_form/constants/constanst.dart';

class payment_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: payment(),
    );
  }
}

class payment extends StatefulWidget {
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
           Color(0xfffcdf8a),
           Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  final cardDecoration =
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black12,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Stack(
              children: [
                CreditCardInputForm(
                  showResetButton: true,
                  prevButtonDecoration: buttonDecoration,
                  nextButtonDecoration: buttonDecoration,
                  prevButtonTextStyle: buttonTextStyle,
                  nextButtonTextStyle: buttonTextStyle,
                  resetButtonTextStyle: buttonTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
