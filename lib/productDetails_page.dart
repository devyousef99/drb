// ignore_for_file: file_names, use_key_in_widget_constructors, avoid_print
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Modules/products.dart';
import 'cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test',
      home: ProductDetail(),
    );
  }
}

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? valueChoose;
  int _counter = 1;
  String? selectedValue;
  String? selectedValue1;
  Future<void> addtocart() async {
    var response = await http
        .post(Uri.parse("http://10.0.2.2:8000/account/sign/4"), body: {
      'product': [
        {'pr_name': 'text', 'id': 'id'}
      ],
      'price': 'price',
      'size': 'size',
      'quantity': 'quantity'
    });
    if (response.statusCode == 200) {
      print("Welcome");
      Get.to('Next Screen');
    } else {
      print("Wrong Data");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    final Products? passedData =
        ModalRoute.of(context)!.settings.arguments as Products?;
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
                Get.to(const Cart());
              },
              color: Colors.black,
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
          centerTitle: true,
          title: passedData != null
              ? Text(
                  passedData.owner.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              : const Center(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: SizedBox(
                    height: 300.0,
                    width: 300.0,
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
                              child: productImages(
                                  passedData!.detail![0].prImg.toString()),
                            ),
                          ),
                        );
                      },
                      //itemCount: passed_data.length,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20.0,
                        bottom: 10.0,
                      ),
                      child: Text(
                        passedData!.prName.toString(),
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 5.0, top: 5.0),
                      child: Text(
                        passedData.prDescription.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
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
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          selectedItemHighlightColor:
                              const Color.fromRGBO(110, 114, 253, 0.9),
                          hint: const Text(
                            'Select Color',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(110, 114, 253, 0.9),
                            ),
                          ),
                          value: selectedValue,
                          items: passedData.detail!
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item.prSize.toString(),
                                  child: Text(
                                    item.prSize.toString(),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                            // print(value);
                          },
                          buttonHeight: 40,
                          buttonWidth: 100,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
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
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          selectedItemHighlightColor:
                              const Color.fromRGBO(110, 114, 253, 0.9),
                          hint: const Text(
                            'Select Size',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(110, 114, 253, 0.9),
                            ),
                          ),
                          value: selectedValue1,
                          items: passedData.detail!
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item.prSize.toString(),
                                  child: Text(
                                    item.prSize.toString(),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue1 = value as String;
                            });
                            // print(value);
                          },
                          buttonHeight: 40,
                          buttonWidth: 100,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
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
                                    if (
                                        // passed_data.itemQunatity!
                                        _counter >= 2) {
                                      _counter--;
                                      //   passed_data.itemQunatity!;
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
                                  if (_counter <
                                      passedData.detail![0].prQunatity!
                                          .toInt()) {
                                    _counter++;
                                  } else {
                                    return;
                                  }
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
                    const SizedBox(
                      width: 180,
                    ),
                    Text(
                      passedData.detail![0].prPrice.toString(),
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
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
                      Get.to(const Cart());
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

Widget productImages(String? image) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 292,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                image: NetworkImage('http://10.0.2.2:8000' + image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
