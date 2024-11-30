import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/utility/AppPreference.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/offers_list_controller.dart';
import 'OfferDetailScreen.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final offersController = Get.find<OffersListController>();

  @override
  void initState() {
    super.initState();
    offersController.getslideroffers();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.Buttoncolor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80,
        title: Text(
          "Offer List",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Obx(
            () => offersController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : offersController.offersdata != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
     CarouselSlider(
  items: offersController.offersdata!.gold1.map((offer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.93, // Optional: adjust container width as per requirement
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                offer.adImage,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 50,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }).toList(),
  options: CarouselOptions(
    height: 200,
    aspectRatio: 16 / 9,
    viewportFraction: 0.99, // Makes the carousel items wider
    initialPage: 0,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  ),
),


                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 80,
                              width: size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green, // Starting color of the gradient
                                    Colors.yellow.shade400, // Ending color of the gradient
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // First image container
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/Green-Vegetables.jpg",
                                          fit: BoxFit.cover, // Ensure it fits the container
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text widget for "Leafy Vegetables"
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        'Leafy Vegetables',
                                        style: TextStyle(
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis, // In case the text overflows
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  // Second image container
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/leaf_vegitables.jpg",
                                          fit: BoxFit.cover, // Ensure consistent fitting
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CarouselSlider(
  items: offersController.offersdata!.gold2.map((offer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.93, // Optional: adjust container width as per requirement
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                offer.adImage,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 50,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }).toList(),
  options: CarouselOptions(
    height: 200,
    aspectRatio: 16 / 9,
    viewportFraction: 0.99, // Makes the carousel items wider
    initialPage: 0,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  ),
),

                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 80,
                              width: size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green, // Starting color of the gradient
                                    Colors.yellow.shade400, // Ending color of the gradient
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // First image container
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/images (1).jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text widget for "Fruits & Nuts"
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        'Fruits & Nuts',
                                        style: TextStyle(
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  // Second image container
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/images (2).jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
//                                      CarouselSlider(
//   items: offersController.offersdata!.bronze1.map((offer) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: size.width * 0.93, // Optional: adjust container width as per requirement
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 offer.adImage,
//                 fit: BoxFit.fill,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(
//                     Icons.broken_image,
//                     color: Colors.grey,
//                     size: 50,
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }).toList(),
//   options: CarouselOptions(
//     height: 200,
//     aspectRatio: 16 / 9,
//     viewportFraction: 0.99, // Makes the carousel items wider
//     initialPage: 0,
//     enableInfiniteScroll: true,
//     autoPlay: true,
//     autoPlayInterval: const Duration(seconds: 3),
//     autoPlayAnimationDuration: const Duration(milliseconds: 800),
//     autoPlayCurve: Curves.fastOutSlowIn,
//     enlargeCenterPage: true,
//     scrollDirection: Axis.horizontal,
//   ),
// ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/nodata.png", fit: BoxFit.contain),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
