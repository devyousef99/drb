// ignore_for_file: file_names
// // ignore_for_file: file_names
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class eventMap_page extends StatefulWidget {
//   const eventMap_page({Key? key}) : super(key: key);
//
//   @override
//   State<eventMap_page> createState() => _eventMap_pageState();
// }
//
// class _eventMap_pageState extends State<eventMap_page> {
//   final Completer<GoogleMapController> _controller = Completer();
//   final List<Marker> markers = <Marker>[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         leading: GestureDetector(
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios_outlined,
//                 color: Colors.white,
//               ),
//               onPressed: () {},
//             ),
//           ),
//         ),
//         centerTitle: true,
//         title: Text(
//           'Event',
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/background.png'), fit: BoxFit.fill),
//           ),
//           child: Column(children: [
//             const SizedBox(
//               height: 60,
//             ),
//             PreferredSize(
//               preferredSize: const Size.fromHeight(60),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     prefixIcon: const Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     contentPadding: EdgeInsets.zero,
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Stack(
//               children: [
//                 Container(
//                   height: 600,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(20),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: <Widget>[
//                             // Container(
//                             //   margin: const EdgeInsets.only(
//                             //       right: 8, left: 8, top: 30, bottom: 8),
//                             //   width: 350,
//                             //   height: 180,
//                             //   decoration: const BoxDecoration(
//                             //     borderRadius:
//                             //         BorderRadius.all(Radius.circular(10)),
//                             //     color: Color.fromRGBO(88, 93, 249, 1.0),
//                             //   ),
//                             //   child: Row(
//                             //     mainAxisAlignment: MainAxisAlignment.center,
//                             //     children: [
//                             //       Container(
//                             //         width: 130,
//                             //         height: 130,
//                             //         decoration: const BoxDecoration(
//                             //           borderRadius:
//                             //               BorderRadius.all(Radius.circular(10)),
//                             //           image: DecorationImage(
//                             //             image: AssetImage('assets/signin.jpeg'),
//                             //           ),
//                             //         ),
//                             //       ),
//                             //       const SizedBox(
//                             //         width: 50,
//                             //       ),
//                             //       const Text(
//                             //         'DRB CAR',
//                             //         style: TextStyle(
//                             //             fontSize: 20, color: Colors.white),
//                             //       )
//                             //     ],
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 _buildGoogleMap(context),
//                 // Container(
//                 //   height: 250,
//                 //   width: double.infinity,
//                 //   decoration: const BoxDecoration(
//                 //     color: Colors.red,
//                 //     borderRadius: BorderRadius.vertical(
//                 //       top: Radius.circular(20),
//                 //     ),
//                 //   ),
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(10),
//                 //     child: Column(
//                 //       children: [
//                 //         Row(
//                 //           children: <Widget>[
//                 //             Container(
//                 //               margin: const EdgeInsets.only(
//                 //                   right: 8, left: 8, top: 10, bottom: 8),
//                 //               width: 355,
//                 //               height: 180,
//                 //               decoration: const BoxDecoration(
//                 //                 borderRadius: BorderRadius.vertical(
//                 //               top: Radius.circular(20),
//                 //   ),                                color: Color.fromRGBO(88, 93, 249, 1.0),
//                 //               ),
//                 //               child: Row(
//                 //                 mainAxisAlignment: MainAxisAlignment.center,
//                 //                 children: [
//                 //                   Container(
//                 //                     width: 130,
//                 //                     height: 130,
//                 //                     decoration: const BoxDecoration(
//                 //                       borderRadius:
//                 //                           BorderRadius.all(Radius.circular(10)),
//                 //                       image: DecorationImage(
//                 //                         image: AssetImage('assets/signin.jpeg'),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                   const SizedBox(
//                 //                     width: 20,
//                 //                   ),
//                 //                   Column(
//                 //                     mainAxisAlignment: MainAxisAlignment.center,
//                 //                     children: [
//                 //                       const Text(
//                 //                         'DRB CAR',
//                 //                         style: TextStyle(
//                 //                             fontSize: 20, color: Colors.white),
//                 //                       ),
//                 //                       const Text(
//                 //                         'DRB CAR',
//                 //                         style: TextStyle(
//                 //                             fontSize: 20, color: Colors.white),
//                 //                       ),
//                 //                       TextButton.icon(
//                 //                         onPressed: () {},
//                 //                         icon: const Icon(
//                 //                           Icons.location_on_rounded,
//                 //                           color: Color.fromRGBO(
//                 //                               110, 114, 253, 0.9),
//                 //                         ),
//                 //                         label: const Text(
//                 //                           'location',
//                 //                           style: TextStyle(
//                 //                             color: Color.fromRGBO(
//                 //                                 110, 114, 253, 0.9),
//                 //                           ),
//                 //                         ),
//                 //                       ),
//                 //                     ],
//                 //                   ),
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
//
//   Widget myDetailsContainer(String First, String mail, String Last) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     First,
//                     style: const TextStyle(
//                       color: Colors.black54,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       Last,
//                       style: const TextStyle(
//                         color: Colors.black54,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   )
//                 ],
//               )),
//         ),
//         const SizedBox(height: 10.0),
//         Container(
//             child: Text(
//               mail,
//               style: const TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//               ),
//             )),
//         const SizedBox(height: 5.0),
//         Container(
//             child: const Text(
//               "From 09:00 To 17:00 ",
//               style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold),
//             )),
//       ],
//     );
//   }
//
//   //here is the widget is used to show the map on the app.!
//   Widget _buildGoogleMap(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: GoogleMap(
//         zoomGesturesEnabled: true,
//         mapType: MapType.satellite,
//         initialCameraPosition: const CameraPosition(
//             target: LatLng(21.543333, 39.172779), zoom: 12),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: Set<Marker>.of(markers),
//       ),
//     );
//   }
//   //This method is used to get the location when item is clicked.!
//   Future<void> _gotoLocation(double lat, double long) async {
//     setState(() {
//       markers.clear();
//     });
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       target: LatLng(lat, long),
//       zoom: 18,
//       tilt: 25.0,
//       bearing: 45.0,
//     )));
//     setState(() {
//       markers.add(const Marker(
//         //add first marker
//         markerId: MarkerId('Test'),
//         draggable: false,
//         visible: true,
//         position: LatLng(21.553380, 39.145360),
//         //position of marker
//         infoWindow: InfoWindow(
//           //popup info
//           title: 'Marker Title First ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));
//       markers.add(const Marker(
//         //add second marker
//         markerId: MarkerId('Test2'),
//         draggable: false,
//         visible: true,
//         position: LatLng(21.553220, 39.143910),
//         //position of marker
//         infoWindow: InfoWindow(
//           //popup info
//           title: 'Marker Title Second ',
//           snippet: 'My Custom Subtitle',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));
//     });
//   }
// }
