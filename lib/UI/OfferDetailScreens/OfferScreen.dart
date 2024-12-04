import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Models/offerslist_model/offers_click_model.dart';
import '../../Components/AppTheme.dart';
import '../../Controller/offers_list_controller.dart';
import '../../Helper/Helper.dart';

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
    // Using a delayed call to ensure updates are outside the build process
    WidgetsBinding.instance.addPostFrameCallback((_) {
      offersController.getslideroffers(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.Buttoncolor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
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
                          const SizedBox(height: 15),
                          // Carousel 1
                          CarouselSlider(
                            items: offersController.offersdata!.gold1.map((offer) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    List<OffersClickData> filteredOffers = offersController.offersclikeddata
                                        .where((clickedOffer) => clickedOffer.sellerId == offer.sellerId)
                                        .toList();

                                    if (filteredOffers.isNotEmpty) {
                                      print("Filtered Offers Found: ${filteredOffers.length}");
                                    } else {
                                      print("No matching offers found.");
                                    }

                                    Helper.offerState = true;

                                    offersController.getoffersclicked(
                                      type: offer.actionType.name.toLowerCase(),
                                      sellerid: offer.sellerId.toString(),
                                      contentId: offer.contentId.toString(),
                                      coustomerId: Helper.customerID.toString(),
                                    );
                                  },
                                  child: Container(
                                    width: size.width * 0.93,
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
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.99,
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
                          // Gradient Container 1
                          _buildGradientContainer(size, "assets/images/Green-Vegetables.jpg",
                              "Leafy Vegetables", "assets/images/leaf_vegitables.jpg"),
                          const SizedBox(height: 15),
                          // Carousel 2
                          CarouselSlider(
                            items: offersController.offersdata!.gold2.map((offer) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: GestureDetector(
                                  onTap: (){
                                    List<OffersClickData> filteredOffers = offersController.offersclikeddata
                                        .where((clickedOffer) => clickedOffer.sellerId == offer.sellerId)
                                        .toList();

                                    if (filteredOffers.isNotEmpty) {
                                      print("Filtered Offers Found: ${filteredOffers.length}");
                                    } else {
                                      print("No matching offers found.");
                                    }

                                    Helper.offerState = true;

                                    offersController.getoffersclicked(
                                      type: offer.actionType.name.toLowerCase(),
                                      sellerid: offer.sellerId.toString(),
                                      contentId: offer.contentId.toString(),
                                      coustomerId: Helper.customerID.toString(),
                                    );
                                  },
                                  child: Container(
                                    width: size.width * 0.93,
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
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.99,
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
                          // Gradient Container 2
                          _buildGradientContainer(size, "assets/images/images (1).jpg",
                              "Fruits & Nuts", "assets/images/images (2).jpg"),
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

  Widget _buildGradientContainer(Size size, String leftImage, String title, String rightImage) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 80,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green,
              Colors.yellow.shade400,
            ],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: _buildImageContainer(leftImage),
            ),
            Flexible(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Flexible(
              child: _buildImageContainer(rightImage),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
