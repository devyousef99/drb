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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_basket),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'), fit: BoxFit.fill),
            ),
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     Stack(
                    children: <Widget>[
                    Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.blue.shade200,
                      image: DecorationImage(image: AssetImage("images/shoes_1.png"))),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            "NIKE XTM Basketball Shoeas",
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                    const SizedBox(height: 6),
                       const  Text(
                          "Green M",
                          style: TextStyle(fontSize: 14),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "\$299.00",
                                // style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.green),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ),
                                    Container(
                                      color: Colors.grey.shade200,
                                      padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                      child: Text(
                                        "1",
                                        // style: CustomTextStyle.textFormFieldSemiBold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 100,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Colors.green),
            ),
          )
          ],
        ),
        // Padding(padding: EdgeInsets.only(top: 80, left: 18, right: 18),
                  // child: Container(
                  //   height: 200.0,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 30.0),
                  //     child: ListView.builder(
                  //       physics: const ClampingScrollPhysics(),
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return AnimationConfiguration.staggeredGrid(
                  //           position: index,
                  //           columnCount: 2,
                  //           child: ScaleAnimation(
                  //             child: FadeInAnimation(
                  //               delay: const Duration(milliseconds: 100),
                  //               child: MyCart(_itemsData[index]),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       itemCount: _itemsData.length,
                  //     ),
                  //   ),
                  // ),),
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
                        'Add To Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }
}
