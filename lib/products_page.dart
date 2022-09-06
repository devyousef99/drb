// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'Modules/products.dart';
import 'productDetails_page.dart';
import 'package:http/http.dart' as http;

// Products page.
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Product(),
    );
  }
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Future<List<Products>> _products() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:8000/product/get_products"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    _products();
  }

  @override
  Widget build(BuildContext context) {
    //List<Category> _itemsData = itemsData()._items;
    //final String? passed_data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                // Get.back();
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'passed_data!',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Get.to(const Cart());
        //     },
        //     color: Colors.white,
        //     icon: const Icon(Icons.shopping_bag),
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white,
              ),
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
            padding: const EdgeInsets.only(
              top: 60,
              left: 8,
              right: 8,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.filter_list_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: FutureBuilder(
                      future: _products(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index) {
                              List<Products> item = snapshot.data;
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    delay: const Duration(milliseconds: 100),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProductDetail(),
                                                settings: RouteSettings(
                                                    arguments: item[index])));
                                      },
                                      child: productImages(
                                          item[index].data.toString(),
                                          item[index].data.toString(),
                                          item[index].data.toString()),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productImages(String? image, String? name, String? price) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 183,
              height: 169,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65.0),
                  child: Text(
                    price!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
