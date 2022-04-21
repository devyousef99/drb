import 'dart:convert';
import 'package:drb/Modules/cart.dart';
import 'package:drb/Modules/users.dart';
import 'package:drb/productDetails_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Modules/products.dart';
import 'Modules/category.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cart(),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Products>? allProducts;
  List<Category>? allCat;
  var test;
  // Users? user;
  var userData;

  void _getData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    test = shared.getString('Users');
    // user = Users.fromJson(test);
    // SharedPreferences shared = await SharedPreferences.getInstance();
    // print(shared.getString('Users')!);
    Map<String, dynamic> jsonData = jsonDecode(test!);
    userData = Users.fromJson(jsonData);
  }

  Future<List<Refrence>> getCartUser() async {
    // SharedPreferences shared = await SharedPreferences.getInstance();
    // var test = shared.getString('Users');
    // user = Users.fromJson(json.decode(test!));
    final response = await http
        .get(Uri.parse("http://10.0.2.2:8000/cart/get_cart/${userData}"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Refrence.fromJson(data)).toList();
    } else {
      print(userData);
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
    getCartUser();
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
                            future: getCartUser(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
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
                                            delay: const Duration(
                                                milliseconds: 100),
                                            child: GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) => productDetails(),
                                                //         settings: RouteSettings(
                                                //             arguments: item[index]
                                                //         )));
                                              },
                                              child: myCart(
                                                'item[index].product![0].detail![0].prImg',
                                                item[index].product![0].prName,
                                                item[index].price.toString(),
                                              ),
                                            ),
                                          ),
                                        ));
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
                          Get.to(const CheckOutPage());
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
                          image:
                              NetworkImage('http://10.0.2.2:8000' + image!))),
                  child: InkWell(
                    onTap: () {
                      Get.to(const ProductDetailPage());
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
