import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Components/AppTheme.dart';
import 'package:grosshop/Controller/settings/settings_controller.dart';
import 'package:grosshop/Helper/Helper.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';

class WriteYourFeedbackScreen extends StatefulWidget {
  const WriteYourFeedbackScreen({super.key});

  @override
  State<WriteYourFeedbackScreen> createState() =>
      _WriteYourFeedbackScreenState();
}

class _WriteYourFeedbackScreenState extends State<WriteYourFeedbackScreen> {
  final controller = Get.find<SettingsController>();


  @override
  void initState() {
    controller.getFeedBack(customerId: Helper.customerID.toString());
    super.initState();
  }

  void showToast(String message, bool isSuccess) {
    MotionToast(
      primaryColor: isSuccess ? Colors.green : Colors.red,
      title: Text(
        isSuccess ? "Success" : "Error",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      description: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70,
      borderRadius: 12,
      displaySideBar: false,
      enableAnimation: true,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppTheme.Buttoncolor,
        automaticallyImplyLeading: false,
        title: Text(
          "Feedback",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "We value your feedback!",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Let us know your thoughts to help us improve our service.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Rating Section
                    GetBuilder<SettingsController>(
                      builder: (_) {
                        return Column(
                          children: [
                            SlideRatingDialog(

                              buttonTitle: controller.isLoading.value
                                  ? "Submitting..."
                                  : "Submit Feedback",
                              buttonColor: AppTheme.green,
                              buttonOnTap: () async {
                                controller.setLoading(true);

                                await controller.addfeedback(
                                  customerId: Helper.customerID,
                                  rating:
                                      controller.rating.value.toString(),
                                  reviewText: controller
                                      .reviewTextController.text,
                                );

                                controller.setLoading(false);

                                if (controller.feedbackSuccess.value) {
                                  showToast(
                                      "Feedback shared successfully", true);
                                } else {
                                  showToast("Failed to share feedback", false);
                                }

                                Navigator.pop(context);
                              },
                              ratingBarBackgroundColor: Colors.grey[300],
                              onRatingChanged: (newRating) {
                                controller.rating.value =
                                    newRating.toDouble();
                              },
                              showCancelButton: false,
                            ),
                            const SizedBox(height: 20),
                            // Text Field for Review Input
                            TextField(
                              controller: controller.reviewTextController,
                              maxLines: 4,
                              style: GoogleFonts.poppins(fontSize: 12),
                              decoration: InputDecoration(
                                labelText: "Write your review",
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey[400]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: AppTheme.Buttoncolor,
                                  ),
                                ),
                                hintText: "e.g. Excellent service!",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
