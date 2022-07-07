// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:drb/products_page.dart';
import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Modules/products.dart';
import 'Modules/category.dart';
import 'cart_page.dart';
import 'productDetails_page.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Store(),
    );
  }
}

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  StoreState createState() => StoreState();
}

class StoreState extends State<Store> {
  String token = '88b8aaf9b86a29d4ec41f3f4734bd349b09588d4';
  Future<Products> _products() async {
    final response = await http.get(
        Uri.parse('https://drbdesignksa.daftra.com/api2/products'),
        headers: {
          'APIKEY': token,
          'Cookie':
              'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
        });
    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse);
      return Products.fromJson(jsonresponse);
    } else {
      throw Exception(response.body);
    }
  }

  Future<Category> _category() async {
    final response = await http.get(
        Uri.parse("https://drbdesignksa.daftra.com/api2/product_categories"),
        headers: {
          'APIKEY': token,
          'Cookie':
              'AWSALB=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBCORS=/QPYc0UjT3Wy6GL8n4Y1WYpDLYrV9t/U8kM53Z53dXjuVhNO5G7YyZK1ITsmm7opP97ZkxtVyyJsBaTHrr+sW6TxunkvdSsB/o83SLTi7+Gn4WUnBSWx93HovWBl; AWSALBTG=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; AWSALBTGCORS=FJToTAru1C0hri+/RVp0PizExpqRz8gdOQC5m0njIdgH2gwNAHovBGcx2h1+e2IFjyPCDeqOQtfNCQhjCQJKA5cxy9gKPAt/y72eCQvNRlwReoDds8Ul+H9Y62bcLW1jtV/aYrA1gcZCtghv+VpZe52LUzuqldrOyaXVe5E1JeVj; OISystem=4hjblj0k2kkhdqjji6vqt7tpq2'
        });
    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);
      print(jsonresponse);
      return Category.fromJson(jsonresponse);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    _products();
    _category();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Community Of Creators',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Cart());
            },
            color: Colors.white,
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: FutureBuilder<Products>(
                      future: _products(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data!.data!;
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    delay: const Duration(milliseconds: 100),
                                    child: adSpace(
                                      item[index].product!.productImage,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        // By default, show a loading spinner.
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: FutureBuilder<Category>(
                          future: _category(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: (context, index) {
                                    final items = snapshot.data!.data!;
                                    return AnimationConfiguration.staggeredGrid(
                                        position: index,
                                        columnCount: 1,
                                        child: categories(
                                          items[index].categoriesCategory!.name,
                                        ));
                                  });
                            }
                            // By default, show a loading spinner.
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                        // child: FutureBuilder<Category>(
                        //     future: _category(),
                        //     builder:
                        //         (BuildContext context, AsyncSnapshot snapshot) {
                        //       if (snapshot.hasData) {
                        //         return ListView.builder(
                        //             shrinkWrap: true,
                        //             physics: const ClampingScrollPhysics(),
                        //             scrollDirection: Axis.horizontal,
                        //             itemCount: snapshot.data.length,
                        //             itemBuilder: (context, index) {
                        //               final item = snapshot.data;
                        //               return AnimationConfiguration
                        //                   .staggeredGrid(
                        //                       position: index,
                        //                       columnCount: 1,
                        //                       child: categories(snapshot.data.);
                        //             });
                        //       } else if (snapshot.hasError) {
                        //         return Text('${snapshot.error}');
                        //       }
                        //       // By default, show a loading spinner.
                        //       return const CircularProgressIndicator();
                        //     }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Newest',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200.0,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  //  Yousef
                  // child: FutureBuilder(
                  //     future: _products(),
                  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //       if (snapshot.hasData) {
                  //         return ListView.builder(
                  //           physics: const ClampingScrollPhysics(),
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             List<ProductImage> item = snapshot.data.length;
                  //             return AnimationConfiguration.staggeredGrid(
                  //               position: index,
                  //               columnCount: 2,
                  //               child: card2(item[index].productId),
                  //             );
                  //           },
                  //           itemCount: snapshot.data.length,
                  //         );
                  //       }
                  //       // By default, show a loading spinner.
                  //       return const CircularProgressIndicator();
                  //     }),
                  child: FutureBuilder<Products>(
                    future: _products(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                final item = snapshot.data!.data!;
                                return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    columnCount: 1,
                                    child: card2(
                                      item[index].product!.productImage,
                                    ));
                              }),
                        );
                      }
                      // By default, show a loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
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
                    width: 150,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: FutureBuilder<Products>(
                  future: _products(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: snapshot.data!.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                            ),
                            itemBuilder: (context, index) {
                              final item = snapshot.data!.data!;
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    delay: const Duration(milliseconds: 100),
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(),
                                                settings: RouteSettings(
                                                    arguments: item[index])));
                                      }),
                                      child: productImages(
                                          item[index].product!.productImage,
                                          item[index]
                                                  .product!
                                                  .productCategory!
                                                  .isNotEmpty
                                              ? item[index]
                                                  .product!
                                                  .productCategory![0]
                                                  .name
                                                  .toString()
                                              : item[index]
                                                  .product!
                                                  .name
                                                  .toString(),
                                          item[index]
                                              .product!
                                              .buyPrice
                                              .toString()),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    // By default, show a loading spinner.
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                //Yousef
                // child: item != null
                //     ? GridView.builder(
                //         shrinkWrap: true,
                //         physics: const ScrollPhysics(),
                //         gridDelegate:
                //             const SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           childAspectRatio: 0.85,
                //         ),
                //         itemCount: item!.length,
                //         itemBuilder: (BuildContext context, index) {
                //           final items = item![index];
                //           return AnimationConfiguration.staggeredGrid(
                //             position: index,
                //             columnCount: 2,
                //             child: ScaleAnimation(
                //               child: FadeInAnimation(
                //                 delay: const Duration(milliseconds: 100),
                //                 child: GestureDetector(
                //                   onTap: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 ProductDetail(),
                //                             settings: RouteSettings(
                //                                 arguments: item![index])));
                //                   },
                //                   child: productImages(
                //                       items.data![index].product!.name
                //                           .toString(),
                //                       items.data![index].product!.name
                //                           .toString(),
                //                       items.data![index].product!.name
                //                           .toString()),
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       )
                //     : const Center(
                //         child: Text(
                //           "No Data",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ['A', 'd', 'd'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

//this is the design created to show a list of data.
Widget adSpace(List<ProductImage>? productImage) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 300,
              height: 200,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('$productImage'),
                  fit: BoxFit.fill,
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget card2(List<ProductImage>? productImage) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('$productImage'),
                  fit: BoxFit.fill,
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget productImages(
        List<ProductImage>? productImage, String? name, String? buyPrice) =>
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 183,
            height: 169,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('$productImage'),
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
                    fontSize: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text(
                  buyPrice!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );

//this is the design created to show a list of data.
Widget categories(String? name) => ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: [
        EasyOutlinedButton(
          label: name!,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          labelColor: Colors.white,
          isRounded: true,
          onPressed: () {},
        ),
      ],
    );
