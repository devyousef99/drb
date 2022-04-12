// ignore_for_file: file_names

import 'package:drb/drbCarDetails_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrbCarPage extends StatefulWidget {
  const DrbCarPage({Key? key}) : super(key: key);

  @override
  State<DrbCarPage> createState() => _DrbCarPageState();
}

class _DrbCarPageState extends State<DrbCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text(
      //     'Drb Car',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            PreferredSize(
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
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            right: 10,
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.filter_list_rounded,
                                    color: Color.fromRGBO(249, 194, 75, 0.9),
                                  ),
                                  label: const Text(
                                    'View all events on map',
                                    style: TextStyle(
                                      color: Color.fromRGBO(110, 114, 253, 0.9),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 8, left: 8, top: 8, bottom: 8),
                              width: 130,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue.shade200,
                                image: const DecorationImage(
                                  image: AssetImage("images/shoes_1.png"),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      width: 45,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          right: 25, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'f',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'f',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    child: const Text(
                                      "NIKE XTM Basketball Shoeas",
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(children: const [
                                    Text(
                                      "Green",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.location_on_rounded,
                                        color:
                                            Color.fromRGBO(110, 114, 253, 0.9),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "\$299.00",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 120,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  110, 114, 253, 0.9),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.to(const DrbCarDetailPage());
                                            },
                                            child: const Text(
                                              'View',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
