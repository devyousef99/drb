import 'package:drb/productDetails_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'checkout_page.dart';

// Custom class to show the data.
class Category {
  String name, image;
  Category({required this.name, required this.image});
}

// Custom list to show the data.
class itemsData {
  final List<Category> _items = <Category>[
    Category(name: 'item1', image: ''),
    Category(name: 'item2', image: ''),
    Category(name: 'item3', image: ''),
    Category(name: 'item2', image: ''),
    Category(name: 'item3', image: ''),
  ];
// List <Category> get items => _items;
}

class cart_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: cart(),
    );
  }
}

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  void initState() {
    super.initState();
  }

  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    List<Category> _itemsData = itemsData()._items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cart',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(
                                    right: 8, left: 8, top: 8, bottom: 8),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.blue.shade200,
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("images/shoes_1.png"))),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(productDetails_page());
                                  },
                                )),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 8, top: 4),
                                      child: const Text(
                                        "NIKE XTM Basketball Shoeas",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(children: const [
                                      Text(
                                        "Green",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 30),
                                      Text(
                                        "M",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ]),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          "\$299.00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (_counter >= 2) {
                                                      _counter--;
                                                    } else {
                                                      return;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                decoration: const BoxDecoration(
                                                    color: Colors.white),
                                                child: Text(
                                                  '$_counter',
                                                  style: const TextStyle(
                                                      // color: Colors.red,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _counter++;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              flex: 100,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 25, top: 15),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 300.0,
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
                        Get.to(checkout_page());
                      },
                      child: const Text(
                        'Ckeckout',
                        style: TextStyle(color: Colors.white),
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
