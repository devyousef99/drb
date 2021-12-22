import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class cart_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: cart(),
    );
  }
}

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
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
          title: Text(
            "My Cart",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        child: Image(
                          image: AssetImage("assets/signin.jpeg"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Blazer Jecket",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black54),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_counter >= 2) {
                                      _counter--;
                                    } else {
                                      return null;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              child: Text(
                                '$_counter',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _counter++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text("CHECK OUT"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
