import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Controller/offers_list_controller.dart/offers_list_controller.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/OfferScreenController.dart';
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
          height: size.height * 0.9,
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
                          // Adjusted Carousel Slider with dynamic width
                          CarouselSlider(
                            items: offersController.offersdata!.gold1.map((offer) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: size.width * 0.8, // Dynamic width based on screen size
                                  child: Card(
                                    color: AppTheme.blueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  offer.subscriptionType ?? '',
                                                  style: GoogleFonts.poppins(
                                                    color: const Color(0xFFB4B4B4),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => OfferDetailScreen(),
                                                      ),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(65, 30),
                                                    backgroundColor: Colors.orange,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Click Me',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              offer.adImage ?? '',
                                              width: size.width * 0.3,
                                              height: 100,
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error, stackTrace) {
                                                return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200, // Increased height for better visibility
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.9, // Adjusted to increase item width in the view
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
                          const SizedBox(height: 10),
                          CarouselSlider(
                            items: offersController.offersdata!.gold2.map((offer) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: size.width * 0.8, // Dynamic width based on screen size
                                  child: Card(
                                    color: AppTheme.blueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  offer.subscriptionType ?? '',
                                                  style: GoogleFonts.poppins(
                                                    color: const Color(0xFFB4B4B4),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => OfferDetailScreen(),
                                                      ),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(65, 30),
                                                    backgroundColor: Colors.orange,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Click Me',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              offer.adImage ?? '',
                                              width: size.width * 0.3,
                                              height: 100,
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error, stackTrace) {
                                                return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200, // Increased height for better visibility
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.9, // Adjusted to increase item width in the view
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
