// ignore_for_file: file_names
import 'dart:convert';
import 'dart:ui';
import 'package:drb/products_page.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:group_button/group_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Modules/category.dart';
import 'Modules/products.dart';
import 'cart_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
  // String? ValueChoose;
  int _counter = 1;
  // Products? item;
  // List<Products>? all_products;
  //
  // Future<List<Products>> _Products() async {
  //   final response =
  //   await http.get(Uri.parse("http://10.0.2.2:8000/product/get_products"));
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((data) => Products.fromJson(data)).toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  void initState() {
    super.initState();
    // _Products();
    // all_products;
  }

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    final Products? passed_data =
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
                Get.to(cart());
              },
              color: Colors.black,
              icon: const Icon(Icons.shopping_bag),
            ),
          ],
          centerTitle: true,
          title: passed_data != null
              ? Text(
            passed_data.itemName.toString(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
              : Center(),
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
                                  passed_data!.itemImg.toString()),
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
                        'st',
                        // passed_data!.itemName.toString(),
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
                          top: 5, left: 20.0, bottom: 10.0),
                      child: Text(
                        'name',
                        // passed_data.itemName.toString(),
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
                      child: Text(
                        'des',
                        // passed_data.itemDesc.toString(),
                        style: TextStyle(
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
                            'Select size',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(110, 114, 253, 0.9),
                            ),
                          ),
                          items: items
                              .map(
                                (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                          )
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
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
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2(
                    //     selectedItemHighlightColor:
                    //         const Color.fromRGBO(110, 114, 253, 0.9),
                    //     items: items
                    //         .map((item) => DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: const TextStyle(
                    //                     fontSize: 14, color: Colors.black),
                    //               ),
                    //             ))
                    //         .toList(),
                    //     value: selectedValue,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedValue = value as String;
                    //       });
                    //     },
                    //     buttonHeight: 40,
                    //     buttonWidth: 100,
                    //     itemHeight: 40,
                    //   ),
                    // ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(
                //         left: 20.0,
                //         top: 10.0,
                //       ),
                //       child: MediaQuery.removePadding(
                //         context: context,
                //         removeBottom: true,
                //         child: SizedBox(
                //           height: 100.0,
                //           width: 100.0,
                //           child: ListView.builder(
                //             physics: const ClampingScrollPhysics(),
                //             shrinkWrap: true,
                //             scrollDirection: Axis.horizontal,
                //             itemBuilder: (context, index) {
                //               return AnimationConfiguration.staggeredGrid(
                //                 position: index,
                //                 columnCount: 2,
                //                 child: ScaleAnimation(
                //                   child: FadeInAnimation(
                //                     delay: const Duration(milliseconds: 100),
                //                     child: productImages(
                //                         passed_data!.itemImg.toString()
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //             //itemCount: passed_data.length,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
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
                            'Select size',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(110, 114, 253, 0.9),
                            ),
                          ),
                          items: items
                              .map(
                                (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                          )
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
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
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2(
                    //     selectedItemHighlightColor:
                    //         const Color.fromRGBO(110, 114, 253, 0.9),
                    //     items: items
                    //         .map((item) => DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: const TextStyle(
                    //                     fontSize: 14, color: Colors.black),
                    //               ),
                    //             ))
                    //         .toList(),
                    //     value: selectedValue,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedValue = value as String;
                    //       });
                    //     },
                    //     buttonHeight: 40,
                    //     buttonWidth: 100,
                    //     itemHeight: 40,
                    //   ),
                    // ),
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
                                // passed_data.itemQunatity.toString(),
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
                    const SizedBox(
                      width: 180,
                    ),
                    Text(
                      'pr',
                      // passed_data.itemPrice.toString(),
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
        height: 300,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          image: DecorationImage(
            image: NetworkImage(image!),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ],
  ),
);
