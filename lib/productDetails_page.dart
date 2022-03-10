// ignore_for_file: file_names
import 'dart:ui';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

class Category {
  String name, image;
  Category({required this.name, required this.image});
}

// Custom list to show the data.
class itemsData {
  final List<Category> _items = <Category>[
    Category(name: 'item1', image: 'assets/signin.jpeg'),
    Category(name: 'item2', image: 'assets/signin.jpeg'),
    Category(name: 'item3', image: 'assets/signin.jpeg'),
    Category(name: 'item4', image: 'assets/signin.jpeg'),
    Category(name: 'item5', image: 'assets/signin.jpeg'),
  ];
// List <Category> get items => _items;
}

class productDetails_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: productDetails(),
    );
  }
}

class productDetails extends StatefulWidget {
  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  String? ValueChoose;
  int _counter = 1;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> _itemsData = itemsData()._items;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(cart());
              },
              color: Colors.black,
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Shop',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              delay: const Duration(milliseconds: 100),
                              child: productImages(_itemsData[index]),
                            ),
                          ),
                        );
                      },
                      itemCount: _itemsData.length,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 20.0,
                        bottom: 10.0,
                      ),
                      child: Text(
                        'store name',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 20.0,
                        bottom: 10.0,
                      ),
                      child: Text(
                        'product name',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                    ),
                    Text(
                      'price',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
                      child: Text(
                        'product info',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(110, 114, 253, 0.9),
                        ),
                        child: Row(
                          children: [
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
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Text(
                                '$_counter',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
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
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: GroupButton(
                        buttonWidth: 45,
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: const Color.fromRGBO(110, 114, 253, 0.9),
                        isRadio: true,
                        elevation: 3,
                        buttons: const ['S', 'M', 'L', 'XL'],
                        onSelected: (int index, bool isSelected) =>
                            print('$index button is selected'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                        top: 10.0,
                      ),
                      child: GroupButton(
                        buttonWidth: 45,
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: const Color.fromRGBO(110, 114, 253, 0.9),
                        isRadio: true,
                        elevation: 3,
                        buttons: const ['S', 'M', 'L', 'XL'],
                        onSelected: (int index, bool isSelected) =>
                            print('$index button is selected'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
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
                      Get.to(cart());
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

Widget productImages(Category category) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280,
            height: 270,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );

Widget productColors(Category category) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
