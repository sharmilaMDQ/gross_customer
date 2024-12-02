import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/ApiConfig/ApiUrl.dart';
import 'package:grosshop/Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Controller/LoginScreenController.dart';
import 'CreateAccountScreen.dart';
import 'ForgotPasswordScreen.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final LoginScreenController passwordController = Get.put(LoginScreenController());
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Center(
                          child: Text(
                            'Login to continue',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextInput1(
                    label: "Mobile Number",
                    onPressed: () {},
                    contentPaddingV: 15,
                    MaxLength: 10,
                    controller: controller.mobileNumberController,
                    textInputType: TextInputType.number,
                    textColor: Color(0xCC252525),
                    hintText: "Enter Your Mobile Number",
                    onTextChange: (String) {
                      // if (text.isEmpty) {
                      //   return;
                      // }
                      // if (text.length == 10) {
                      //   AppUtility.dismissKeyboard();
                      // }
                    },
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TextInput1(
                        // height: 300,
                        label: "Password ",
                        onPressed: () {},
                        onPressedSuffixIcon: () {
                          controller.toggleVisibility();
                        },
                        contentPaddingV: 15,
                        controller: controller.passwordController,
                        textInputType: TextInputType.text,
                        obscureText: true,
                        textVisible: !controller.isVisible.value,
                        textColor: Color(0xCC252525),
                        hintText: "Enter Password",
                        onTextChange: (String) {},
                        sufficIcon: controller.isVisible.value
                            ? const Icon(
                                Icons.visibility,
                                color: AppTheme.Buttoncolor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppTheme.Buttoncolor,
                              )),
                  ),
                ),

                // Obx(
                //   () => Padding(
                //     padding:
                //         const EdgeInsets.only(top: 15, left: 20, right: 20),
                //     child: TextFormField(
                //         controller: controller.passwordcontroller,
                //         obscureText: !passwordController.isVisible.value,
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(),
                //             // label: Text("Password"),
                //             // labelStyle: GoogleFonts.poppins(
                //             //   color: Colors.black,
                //             //   fontSize: 14,
                //             //   fontWeight: FontWeight.w600,
                //             // ),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: AppTheme.Buttoncolor),
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: AppTheme.Buttoncolor),
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             hintText: 'Password',
                //             contentPadding: EdgeInsets.symmetric(
                //                 vertical: 20, horizontal: 10),
                //             hintStyle: GoogleFonts.poppins(
                //               color: Colors.black26,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w600,
                //             ),
                //             suffixIcon: InkWell(
                //               onTap: () {
                //                 passwordController.toggleVisibility();
                //               },
                //               child: Icon(
                //                 color: AppTheme.Buttoncolor,
                //                 passwordController.isVisible.value
                //                     ? Icons.visibility
                //                     : Icons.visibility_off,
                //               ),
                //             )),
                //         style: TextStyle(
                //             fontSize: 15,
                //             fontWeight: FontWeight.w400,
                //             color: Colors.black)),
                //   ),
                // ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icons/exclamatory .png',
                        height: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),

                Center(
                  child: Obx(() {
                    // Check if both mobile number and password fields are filled
                    bool isButtonEnabled = controller.mobileNumber.isNotEmpty && controller.password.isNotEmpty;

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: Size(330, 55),
                        backgroundColor: 
                          AppTheme.Buttoncolor // Set the button color to grey if fields are empty
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (controller.isLoading.value) {
                          return;
                        }
                        controller.loginApi(context);
                      },
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 15, // Adjust the size of the circular indicator
                              height: 15,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 3, // Adjust the thickness of the spinner
                              ),
                            )
                          : Text(
                              "Login".tr,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    );
                  }),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: GoogleFonts.poppins(
                        color: Color(0x80252525),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                      },
                      child: Text(
                        ' Create?',
                        style: GoogleFonts.poppins(
                          color: AppTheme.Buttoncolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Text(
                  ApiUrl.appVersion,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
