// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class shippingAddress_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: shipping_address(),
    );
  }
}

class shipping_address extends StatefulWidget {
  @override
  _shipping_addressState createState() => _shipping_addressState();
}

class _shipping_addressState extends State<shipping_address> {
  bool SaveAddress = false;
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            'Shipping Address',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 600,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Country/Region",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Full Name",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Building No, Street Name, Apartment",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("City",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Street No",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Unit No",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Mobile Number",
                                      style: TextStyle(color: Colors.grey)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8,
                        thickness: 3,
                        endIndent: 3,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Text('Save this shipping address'),
                            const SizedBox(
                              width: 65,
                            ),
                            Checkbox(
                              checkColor: Colors.greenAccent,
                              activeColor: Colors.white,
                              value: SaveAddress,
                              onChanged: (value) {
                                setState(() {
                                  SaveAddress = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex:1,
                        child:SizedBox(
                          height: 300.0,
                          width: 300.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                              const Color.fromRGBO(110, 114, 253, 0.9),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              //Get.to(checkout_page());
                            },
                            child: const Text(
                              'Ok',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ),
                    ],
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
