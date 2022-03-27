import 'package:drb/shippingAddress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class shipping_page extends StatefulWidget {
  const shipping_page({Key? key}) : super(key: key);

  @override
  State<shipping_page> createState() => _shipping_pageState();
}

class _shipping_pageState extends State<shipping_page> {
  @override
  Widget build(BuildContext context) {
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
                Get.back();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Shipping',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
              top: 90.0,
              right: 15.0,
              left: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 80,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 270,
                          ),
                          child: MaterialButton(
                            child: const Icon(
                              Icons.home,
                              size: 50,
                              color: Color.fromRGBO(
                                76,
                                81,
                                228,
                                0.9,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Get.to(shippingAddress_page());
                      },
                      child: const Icon(
                        CupertinoIcons.add_circled_solid,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Add new address',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
