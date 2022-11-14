// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:drb/home_page.dart';
import 'package:drb/landing_page.dart';
import 'package:drb/productDetails_page.dart';
import 'package:drb/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Modules/products.dart';
import 'checkout_page.dart';

class Cart extends StatefulWidget {
  final List<Product> products;
  const Cart({Key? key, required this.products}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _counter = 1;

  // void _getData() async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   test = shared.getString('Proudct');
  //   product = Product.fromJson(test);
  //   print(shared.getString('Proudct')!);
  //   Map<String, dynamic> jsonData = jsonDecode(test!);
  //   userData = Product.fromJson(jsonData);
  // }

  // Future<List<Refrence>> getCartUser() async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   test = shared.getString('Users');
  //   final response = await http
  //       .get(Uri.parse("http://192.168.1.38:8000/cart/get_cart/$test"));
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((data) => Refrence.fromJson(data)).toList();
  //   } else {
  //     print(test);
  //     throw Exception('Failed to load album');
  //   }
  // }
  // delete product

  clear() async {
    SharedPreferences deleteProduct = await SharedPreferences.getInstance();
    deleteProduct.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
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
                }),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              );
            },
            color: Colors.black,
            icon: const Icon(Icons.store),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: widget.products.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myCart(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300.0,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff6c0ba9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Get.to(const CheckOutPage());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckOutPage()),
                        );
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromARGB(255, 251, 251, 252),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_bag,
                      size: 120,
                      color: Color(0xfff6c0ba9),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Your cart is empty!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xfff6c0ba9),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff6c0ba9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Get.to(const Store());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LandingPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Start shopping',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget myCart() => ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 1,
            child: ScaleAnimation(
              child: FadeInAnimation(
                delay: const Duration(milliseconds: 100),
                child: Container(
                  height: 120,
                  width: 110,
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 5, bottom: 5),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xfff6c0ba9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                                right: 5, left: 5, top: 5, bottom: 5),
                            width: 95,
                            height: 95,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'widget.products[index].productImage'))),
                          ),
                          Expanded(
                            flex: 100,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        const EdgeInsets.only(right: 8, top: 5),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        widget.products[index].name!,
                                        maxLines: 2,
                                        softWrap: true,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      widget.products[index].brand!,
                                      style: const TextStyle(
                                          color: Colors.black45, fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        int maxCount =
                                                            int.parse(widget
                                                                .products[index]
                                                                .stockBalance
                                                                .toString());
                                                        if (_counter > 1) {
                                                          setState(() {
                                                            _counter--;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 5,
                                                                bottom: 5),
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                          ),
                                                          color: Color(
                                                              0xFFF3A48A0),
                                                        ),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white),
                                                      child: Text(
                                                        '$_counter',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        int maxCount =
                                                            int.parse(widget
                                                                .products[index]
                                                                .stockBalance
                                                                .toString());
                                                        if (_counter <
                                                            maxCount) {
                                                          setState(() {
                                                            _counter++;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 5,
                                                                bottom: 5),
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
                                                          ),
                                                          color: Color(
                                                              0xFFF3A48A0),
                                                        ),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${widget.products[index].buyPrice!} SR',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 16,
                            ),
                            onPressed: () {
                              // if (widget.products[index].id ==
                              //         widget.products[index].id &&
                              //     widget.products[index].storesBalance! >= 1) {
                              //   setState(() {
                              //     widget.products[index].storesBalance! - 1;
                              //   });
                              // }
                              // setState(() {
                              //   widget.products.removeWhere((product) {
                              //     return product.id ==
                              //         widget.products[index].id;
                              //   });
                              //   savePrefs(widget.products);
                              // });
                              if (widget.products[index].id ==
                                  widget.products[index].id) {
                                setState(() {
                                  widget.products.removeWhere((product) {
                                    return product.id ==
                                        widget.products[index].id;
                                  });
                                  totalPrice -
                                      double.parse(
                                          widget.products[index].buyPrice!);
                                  savePrefs(widget.products);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //  Stack(children: [
                  //   Row(
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //             right: 8, left: 8, top: 8, bottom: 8),
                  //         width: 100,
                  //         height: 100,
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(5)),
                  //           color: Colors.blue.shade200,
                  //           image: const DecorationImage(
                  //             image: NetworkImage('http://10.0.2.2:8000'),
                  //           ),
                  //         ),
                  //         child: InkWell(
                  //           onTap: () {
                  //             // Get.to(const ProductDetailPage());
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         const ProductDetail(),
                  //                     settings: RouteSettings(
                  //                         arguments: widget.products[index])));
                  //           },
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: const EdgeInsets.all(0.0),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Expanded(
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     widget.products[index].name!,
                  //                     maxLines: 2,
                  //                     softWrap: true,
                  //                     style: const TextStyle(fontSize: 14),
                  //                   ),
                  //                   Align(
                  //                     alignment: Alignment.topRight,
                  //                     widthFactor: 2.4,
                  //                     heightFactor: 1.3,
                  //                     child: IconButton(
                  //                       icon: const Icon(
                  //                         Icons.close,
                  //                         color: Colors.grey,
                  //                         size: 20,
                  //                       ),
                  //                       onPressed: () {
                  //                         setState(() {
                  //                           widget.products.removeWhere(
                  //                               (product) =>
                  //                                   product.id ==
                  //                                   widget.products[index].id);
                  //                           savePrefs(widget.products);
                  //                         });
                  //                       },
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Text(
                  //                   widget.products[index].brand!,
                  //                   maxLines: 2,
                  //                   softWrap: true,
                  //                   style: const TextStyle(fontSize: 14),
                  //                 ),
                  //               ],
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.only(
                  //                     bottom: 5.0,
                  //                     top: 5.0,
                  //                   ),
                  //                   child: Container(
                  //                     padding: const EdgeInsets.only(
                  //                       left: 4,
                  //                       right: 4,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(5),
                  //                       color: const Color.fromRGBO(
                  //                           110, 114, 253, 0.9),
                  //                     ),
                  //                     child: Row(
                  //                       children: [
                  //                         InkWell(
                  //                           onTap: () {
                  //                             if (_counter > 1) {
                  //                               setState(() {
                  //                                 _counter--;
                  //                               });
                  //                             }
                  //                           },
                  //                           child: const Icon(
                  //                             Icons.remove,
                  //                             color: Colors.white,
                  //                             size: 16,
                  //                           ),
                  //                         ),
                  //                         Container(
                  //                           margin: const EdgeInsets.symmetric(
                  //                               horizontal: 5),
                  //                           padding: const EdgeInsets.symmetric(
                  //                               horizontal: 10, vertical: 5),
                  //                           decoration: const BoxDecoration(
                  //                               color: Colors.white),
                  //                           child: Text(
                  //                             '$_counter',
                  //                             style: const TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontSize: 16),
                  //                           ),
                  //                         ),
                  //                         InkWell(
                  //                           onTap: () {
                  //                             int maxCount = int.parse(widget
                  //                                 .products[index].stockBalance
                  //                                 .toString());
                  //                             if (_counter < maxCount) {
                  //                               setState(() {
                  //                                 _counter++;
                  //                               });
                  //                             }
                  //                           },
                  //                           child: const Icon(
                  //                             Icons.add,
                  //                             color: Colors.white,
                  //                             size: 16,
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const SizedBox(
                  //                   width: 120,
                  //                 ),
                  //                 Text(
                  //                   widget.products[index].buyPrice!,
                  //                   style: const TextStyle(
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ]),
                ),
              ),
            ),
          );
        },
      );
}
