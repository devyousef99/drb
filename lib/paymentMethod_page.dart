// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Payment(),
    );
  }
}

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
    gradient: const LinearGradient(
        colors: [
          Color(0xfffcdf8a),
          Color(0xfff38381),
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final buttonTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  final cardDecoration =
      const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)));

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
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(
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
            duration: const Duration(milliseconds: 300),
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
