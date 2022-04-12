import 'package:drb/shippingAddress_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
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
          'Checkout',
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
              top: 100.0,
              right: 18.0,
              left: 18.0,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(const ShippingAddressPage());
                        },
                        child: Container(
                          width: 600,
                          height: 80,
                          // margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 130,
                            ),
                            child: Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Icon(
                                    Icons.home,
                                    size: 50,
                                    color: Color.fromRGBO(
                                      76,
                                      81,
                                      228,
                                      0.9,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          "Green",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const Text(
                                          "Green",
                                          style: TextStyle(fontSize: 14),
                                        ),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          width: 600,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 130,
                            ),
                            child: Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Icon(
                                    Icons.credit_card_rounded,
                                    size: 50,
                                    color: Color.fromRGBO(
                                      76,
                                      81,
                                      228,
                                      0.9,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          "Green",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const Text(
                                          "Green",
                                          style: TextStyle(fontSize: 14),
                                        ),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Promo Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 14,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Apply promo code',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: MaterialButton(
                          splashColor: const Color.fromRGBO(
                            76,
                            81,
                            228,
                            0.9,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Order Summary',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 220,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 18, right: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Sub Total',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 60),
                                  Text(':'),
                                  SizedBox(width: 100),
                                  Text('555'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Shipping',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 63),
                                  Text(':'),
                                  SizedBox(width: 100),
                                  Text('555'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Estimating Tax',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(':'),
                                  SizedBox(width: 100),
                                  Text('555'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Discounts',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 54),
                                  Text(':'),
                                  SizedBox(width: 100),
                                  Text('555'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 8,
                                thickness: 3,
                                endIndent: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 90),
                                  Text(':'),
                                  SizedBox(width: 100),
                                  Text('555'),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 300.0,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color.fromRGBO(
                                          110, 114, 253, 0.9),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: 'Thank You!',
                                          titleStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          middleText:
                                              'Your order is completed. \n Please check delivery status at order tracking page.',
                                          actions: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: const Color.fromRGBO(
                                                    110, 114, 253, 0.9),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Ok',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ]);
                                    },
                                    child: const Text(
                                      'Place Order',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
