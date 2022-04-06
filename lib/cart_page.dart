import 'dart:convert';
import 'package:drb/Modules/cart.dart';
import 'package:drb/productDetails_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Modules/products.dart';
import 'Modules/category.dart';
import 'checkout_page.dart';

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
  List<Products>? all_products;
  List<Category>? all_cat;

  Future<List<Refrence>> _Products() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/cart/get_cart/1"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Refrence.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    _Products();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        FutureBuilder(
                            future: _Products(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, index) {
                                    List<Refrence> item = snapshot.data;
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          delay: const Duration(milliseconds: 100),
                                          child: GestureDetector(
                                            onTap: (){
                                              // Navigator.push(context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) => productDetails(),
                                              //         settings: RouteSettings(
                                              //             arguments: item[index]
                                              //         )));
                                            },
                                            child: myCart(
                                                'item[index]',
                                                item[index].product![0].prName,
                                                item[index].price.toString(),
                                          ),
                                        ),
                                      ),
                                    )
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            }),
                      ],
                    ),
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
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

Widget myCart(String? image, String? name, String? price) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.blue.shade200,
                      image: DecorationImage(
                          image: NetworkImage('http://10.0.2.2:8000'+image!))),
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
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          name!,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(fontSize: 14),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            price!,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                            const Padding(
                            padding: EdgeInsets.only(top: 5),
                            // child: Row(
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.center,
                            //   crossAxisAlignment:
                            //   CrossAxisAlignment.end,
                            //   children: <Widget>[
                            //     InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           if (_counter >= 2) {
                            //             _counter--;
                            //           } else {
                            //             return;
                            //           }
                            //         });
                            //       },
                            //       child: const Icon(
                            //         Icons.remove,
                            //         color: Colors.black,
                            //         size: 16,
                            //       ),
                            //     ),
                            //     Container(
                            //       margin:
                            //       const EdgeInsets.symmetric(
                            //           horizontal: 5),
                            //       padding:
                            //       const EdgeInsets.symmetric(
                            //         horizontal: 10,
                            //       ),
                            //       decoration: const BoxDecoration(
                            //           color: Colors.white),
                            //       child: Text(
                            //         '$_counter',
                            //         style: const TextStyle(
                            //           // color: Colors.red,
                            //             fontSize: 16),
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           _counter++;
                            //         });
                            //       },
                            //       child: const Icon(
                            //         Icons.add,
                            //         color: Colors.black,
                            //         size: 16,
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
    ));
