import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Components/image_pickers.dart';
import '../../Controller/EditProfileController.dart';

List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: scopes,
);

class EditProfileScreen extends GetView<EditProfileScreenController> {
  EditProfileScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    final EditProfileScreenController controller =
        Get.put(EditProfileScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppTheme.IconBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppTheme.Buttoncolor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Edit Your Profile',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Update Your Account Details!',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Center(
                          child: Stack(children: [
                        Obx(
                          () => Container(
                            width: 120,
                            height: 120,
                            child: controller.item_image.value != null
                                ? CircleAvatar(
                                    backgroundImage: Image.file(
                                      controller.item_image.value?.imagePath,
                                      fit: BoxFit.cover,
                                    ).image,
                                  )
                                : controller.imageString.value != null &&
                                        controller.imageString.value.isNotEmpty
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            controller.imageString.value),
                                      )
                                    : const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://autorevog.blob.core.windows.net/autorevog/uploads/images/18942381.jpg'),
                                      ),
                          ),
                        ),
                        Positioned(
                          right: -25,
                          bottom: 5,
                          child: MaterialButton(
                              color: AppTheme.primaryColor,
                              shape: const CircleBorder(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImagePicks(
                                              previewImageList: [],
                                              isMultiple: true,
                                              title: "Select Image",
                                              onClose: () => Get.back(),
                                              onSave:
                                                  (List<PickedImage> images) {
                                                if (images.isNotEmpty) {
                                                  controller.item_image.value =
                                                      images.first;
                                                }
                                                Get.back();
                                              },
                                            )));
                              },
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              )),
                        ),
                      ])),

                      // Obx(
                      //       () => InkWell(
                      //     onTap: () {
                      //       Get.to(
                      //         ImagePick(
                      //           isMultiple: true,
                      //           title: "Profile ",
                      //           onClose: () => Get.back(),
                      //           onSave: (List<PickedImage> images) {
                      //             if (images.isNotEmpty) {
                      //               controller.item_image.value = images[0];
                      //               controller.isImageSelected.value = true;
                      //               // controller.clearImage();
                      //             }
                      //
                      //             Get.back();
                      //           },
                      //         ),
                      //       );
                      //     },
                      //     child: Center(
                      //       child: Container(
                      //         width: 150,
                      //         height: 150,
                      //         decoration: BoxDecoration(
                      //           border: controller.isImageSelected.value
                      //               ? null
                      //               : Border.all(
                      //               color: Colors.red, width: 3), //
                      //           // Add border for validation error
                      //           shape: BoxShape.circle,
                      //         ),
                      //         child: CircleAvatar(
                      //           backgroundColor: Colors.white,
                      //           backgroundImage:
                      //           controller.item_image.value != null
                      //               ? Image.file(
                      //             controller.item_image!.value != null
                      //                 ? controller.item_image!.value!
                      //                 .imagePath
                      //                 : "",
                      //             fit: BoxFit.cover,
                      //           ).image
                      //               : null,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Name",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.namecontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter  Your Name",
                          onTextChange: (String) {},
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Mobile Number",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.mobilenumcontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter  Your Mobile Number",
                          onTextChange: (String) {},
                        ),
                      ),

                      // Obx(
                      //   () => Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 23, vertical:5),
                      //     child: TextFormField(
                      //       focusNode: controller.focusNode,
                      //       obscureText: !controller.isVisible.value,
                      //       controller: controller.passwordcontroller,
                      //       decoration: InputDecoration(
                      //         counter: Offstage(),
                      //         labelText: "Password",
                      //         labelStyle: TextStyle(
                      //             color: AppTheme.textColor,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.w500),
                      //         border: OutlineInputBorder(),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: AppTheme.Buttoncolor),
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: AppTheme.Buttoncolor),
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         hintText: 'Password',
                      //         hintStyle: GoogleFonts.poppins(
                      //           color: Colors.black26,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //         suffixIcon: InkWell(
                      //           onTap: () {
                      //             controller.toggleVisibility();
                      //           },
                      //           child: Icon(
                      //             color: AppTheme.Buttoncolor,
                      //             controller.isVisible.value
                      //                 ? Icons.visibility
                      //                 : Icons.visibility_off,
                      //           ),
                      //         ),
                      //       ),
                      //       style: GoogleFonts.poppins(
                      //         color: Colors.black,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //     ),
                      //   ),
                      // ),ß

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Address",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.addresscontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your Address",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "City",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.citycontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your City",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "State",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.statecontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your State",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "PinCode",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.pincodecontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your PinCode",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Country",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.countrycontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your Country",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Email",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.emailcontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your Email",
                          onTextChange: (String) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextInput1(
                          label: "Delivery",
                          onPressed: () {},
                          contentPaddingV: 15,
                          controller: controller.countrycontroller,
                          textInputType: TextInputType.text,
                          textColor: Color(0xCC252525),
                          hintText: "Enter Your Delivery",
                          onTextChange: (String) {},
                        ),
                      ),






                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Button(
                      widthFactor: 0.9,
                      heightFactor: 0.06,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.RegisterApi(context);
                        }
                      },
                      child:controller.isLoading.value
                          ? Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                          : Text("Update Account".tr,
                        style:GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),)),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
