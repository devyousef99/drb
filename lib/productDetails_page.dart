// ignore_for_file: file_names, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Modules/products.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'cart_page.dart';

// save product in sharedpreferences
Future<void> savePrefs(List<Product> proudcts) async {
  SharedPreferences saveprefs = await SharedPreferences.getInstance();
  saveprefs.setString('userCart', jsonEncode(proudcts));
}

// get product in sharedpreferences
Future<List<Product>> getProudcts() async {
  List<Product> products = [];
  SharedPreferences getprefs = await SharedPreferences.getInstance();
  String? productStr = getprefs.getString('userCart');
  if (productStr != null) {
    List productJson = jsonDecode(productStr);
    products = productJson.map((e) => Product.fromJson(e)).toList();
  }
  return products;
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? valueChoose;
  int _counter = 1;
  String? selectedValue;
  String? selectedValue1;

  // Future<void> addtocart() async {
  //   String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  //   var response = await http.post(
  //       Uri.parse('https://drbdesignksa.daftra.com/api2/products'),
  //       headers: {
  //         'APIKEY': token,
  //         'Cookie':
  //             'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
  //       },
  //       body: {
  //         'Product': [
  //           {'name': 'name', 'id': 'id'}
  //         ],
  //         'buyPrice': 'buyPrice',
  //         'brand': 'brand',
  //         // 'size': 'size',
  //         'stockBalance': 'stockBalance'
  //       });
  //   if (response.statusCode == 200) {
  //     print("Welcome");
  //     Get.to('Next Screen');
  //   } else {
  //     print("Wrong Data");
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Product passedData =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          passedData.brand.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                // Get.back();
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              List<Product> products = await getProudcts();
              // Get.to(const Cart());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(
                    products: products,
                  ),
                ),
              );
            },
            color: Colors.black,
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
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
                                passedData.productImage.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 20.0,
                        bottom: 10.0,
                      ),
                      child: AutoSizeText(
                        passedData.brand.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 20.0,
                        bottom: 10.0,
                      ),
                      child: AutoSizeText(
                        passedData.name.toString(),
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 5.0, top: 5.0),
                      child: AutoSizeText(
                        passedData.description.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 5.0, top: 5.0),
                      child: AutoSizeText(
                        'Product code: ${passedData.productCode}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        maxLines: 1,
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
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButton2(
                    //     selectedItemHighlightColor:
                    //         const Color.fromRGBO(110, 114, 253, 0.9),
                    //     hint: const Text(
                    //       'Select Color',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Color.fromRGBO(110, 114, 253, 0.9),
                    //       ),
                    //     ),
                    //     value: selectedValue,
                    //     items:   selectedValue:
                    //   .map((item) =>
                    //   DropdownMenuItem<String>(
                    //     value: item,
                    //     child: Text(
                    //       item,
                    //       style: const TextStyle(
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //   ))
                    //   .toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         selectedValue = value as String;
                    //       });
                    //       // print(value);
                    //     },
                    //     buttonHeight: 40,
                    //     buttonWidth: 100,
                    //     itemHeight: 40,
                    //   ),
                    // ),
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
                    // child: DropdownButtonHideUnderline(
                    // child: DropdownButton2(
                    //   selectedItemHighlightColor:
                    //       const Color.fromRGBO(110, 114, 253, 0.9),
                    //   hint: const Text(
                    //     'Select Size',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Color.fromRGBO(110, 114, 253, 0.9),
                    //     ),
                    //   ),
                    //   value: selectedValue1,
                    //   items: passedData.data!
                    //       .map(
                    //         (item) => DropdownMenuItem(
                    //           value: item.prSize.toString(),
                    //           child: Text(
                    //             item.prSize.toString(),
                    //             style: const TextStyle(
                    //                 fontSize: 14, color: Colors.black),
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       selectedValue1 = value as String;
                    //     });
                    //     // print(value);
                    //   },
                    //   buttonHeight: 40,
                    //   buttonWidth: 100,
                    //   itemHeight: 40,
                    // ),
                    // ),
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
                                // int maxCount = int.parse(
                                //     passedData.stockBalance.toString());
                                passedData.storesBalance;
                                if (_counter > 1) {
                                  setState(() {
                                    _counter--;
                                  });
                                }
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
                              // int maxCount =
                              //     int.parse(passedData.stockBalance.toString());
                              var maxCount = passedData.storesBalance;
                              if (_counter < maxCount!) {
                                setState(() {
                                  _counter++;
                                });
                              }
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
                    width: 200,
                  ),
                  Text(
                    passedData.buyPrice.toString(),
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
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
                  // Save data in SharedPreferences
                  onPressed: () async {
                    List<Product> products = await getProudcts();
                    bool x = false;
                    for (var c = 0; c < products.length; c++) {
                      if (passedData.id == products[0].id) {
                        if (passedData.storesBalance != null) {
                          setState(() {
                            passedData.storesBalance =
                                passedData.storesBalance! + 1;
                            x = true;
                          });
                        }
                      }
                    }
                    if (x == false) {
                      setState(() {
                        products.add(passedData);
                      });
                    }
                    await savePrefs(products);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(
                          products: products,
                        ),
                      ),
                    );
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
                image: NetworkImage('http://10.0.2.2:8000${image!}'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
