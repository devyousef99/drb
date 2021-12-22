import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class shippingAddress_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: shipping_address(),
    );
  }
}

class shipping_address extends StatefulWidget {
  @override
  _shipping_addressState createState() => _shipping_addressState();
}

class _shipping_addressState extends State<shipping_address> {
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
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 49.0),
            child: Text(
              'Shipping Address',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Address'),
                            hintStyle: TextStyle(
                                color: Color(0xFFE1E1E1), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(
              //           elevation: 10,
              //           padding: EdgeInsets.zero,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(40),),),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 20,
                            padding: EdgeInsets.zero,
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        child: Container(
                          height: 55.0,
                          alignment: Alignment.center,
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
