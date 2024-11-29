import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/MyOrderScreenController.dart';
import '../../utility/Apptab2.dart';
import '../../utility/HorizontalScrollView.dart';

class MyOrderScreen extends GetView<MyOrderScreenController> {
  MyOrderScreen({Key? key}) : super(key: key);

  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    MyOrderScreenController Ordercontrollers = Get.put(MyOrderScreenController());

    return GetBuilder<MyOrderScreenController>(
      init: MyOrderScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.ScreenBackground,
          appBar: AppBar(
            backgroundColor: AppTheme.Buttoncolor,
            automaticallyImplyLeading: false,
            bottomOpacity: 0.0,
            elevation: 0.0,
            toolbarHeight: 80,
            leading: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, right: 0, left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white, // customize color as per requirement
                  ),
                ),
              ),
            ),
            title: Text(
              "Order status",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[],
          ),
          body: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Ordercontrollers.userDataProvider.getCustomerOrderLIst!.pickupTime.toString() != ""
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Pickup:',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(Ordercontrollers.userDataProvider.getCustomerOrderLIst!.pickupTime.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.black26,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Payment method:',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(Ordercontrollers.userDataProvider.getCustomerOrderLIst!.paymentOption.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black26,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Order Status:',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(Ordercontrollers.userDataProvider.getCustomerOrderLIst!.orderStatus.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black26,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Address:',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                              " ${Ordercontrollers.userDataProvider.getCustomerOrderLIst!.customerAddress.toString()} , ${Ordercontrollers.userDataProvider.getCustomerOrderLIst!.customerCity.toString()} ,${Ordercontrollers.userDataProvider.getCustomerOrderLIst!.customerState.toString()} , ${Ordercontrollers.userDataProvider.getCustomerOrderLIst!.customerPincode.toString()} ,  ",
                              style: GoogleFonts.poppins(
                                color: Colors.black26,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        HorizontalScrollView(
                          children: List.generate(
                            Ordercontrollers.MyOrderTablist.length,
                            (index) {
                              var model = Ordercontrollers.MyOrderTablist[index];
                              return AppTab2(
                                title: model.value,
                                isSelected: Ordercontrollers.selectedTabIndex == index,
                                onClick: () => Ordercontrollers.updateCurrentTabIndex(index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Ordercontrollers.MyOrderstproducts.length,
                      itemBuilder: (context, index) {
                        if (Ordercontrollers.selectedTabIndex.value == 1) {
                          return Visibility(
                            visible: Ordercontrollers.currentindex.value == 0 && index == 0,
                            child: _Process(context, index),
                          );
                        } else if (Ordercontrollers.selectedTabIndex.value == 2) {
                          return Visibility(
                            visible: Ordercontrollers.currentindex.value == 0 && index == 0,
                            child: _Track(context, index),
                          );
                        } else {
                          return Visibility(
                            visible: Ordercontrollers.currentindex.value == 0 && index == 0,
                            child: _ProductList(context, index),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _ProductList(context, index) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    MyOrderScreenController Ordercontrollers = Get.put(MyOrderScreenController());

    return GetBuilder<MyOrderScreenController>(
      init: MyOrderScreenController(),
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.MyOrderstproducts.length,
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.grey,
              color: Colors.white,
              //surfaceTintColor: Colors.grey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.asset(
                                  controller.MyOrderstproducts[index].image,
                                  width: width * 0.3,
                                  height: height * 0.1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(controller.MyOrderstproducts[index].ProductName,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: controller.MyOrderstproducts[index].Price,
                                            style: GoogleFonts.poppins(
                                              color: AppTheme.Buttoncolor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: "   (${controller.MyOrderstproducts[index].weight})",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black26,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget _Process(context, index) {
    MyOrderScreenController Ordercontrollers = Get.put(MyOrderScreenController());
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stepper(
              controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: dtl.onStepContinue,
                      child: Text(controller.hide == true ? 'NEXT' : ''),
                    ),
                    TextButton(
                      onPressed: dtl.onStepCancel,
                      child: Text(controller.hide == true ? 'CANCEL' : ''),
                    ),
                  ],
                );
              },
              steps: _stepper(),
              type: stepperType,
              currentStep: Ordercontrollers.currentStep.value,
              onStepTapped: (step) {
                Ordercontrollers.updateCurrentStep(step);
              },
            ),
          ),
        );
      },
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
        title: Row(
          children: [
            Text(controller.headingText1.value,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        content: Column(
          children: <Widget>[
            Text(controller.SubHeadingText1.value,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
        isActive: _currentStep >= 0,
        state: StepState.complete,
      ),
      Step(
        title: Text(controller.headingText2.value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        content: Column(
          children: <Widget>[
            Text(controller.SubHeadingText2.value,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
        isActive: _currentStep >= 2,
        state: StepState.complete,
      ),
      Step(
        title: Text(controller.headingText3.value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        content: Column(
          children: <Widget>[
            Text(controller.SubHeadingText3.value,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
        isActive: _currentStep >= 2,
        state: StepState.complete,
      ),
      Step(
        title: Text(controller.headingText4.value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        content: Column(
          children: <Widget>[
            Text(controller.SubHeadingText4.value,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
        isActive: _currentStep >= 3,
        state: StepState.complete,
      ),
      Step(
        title: Text(controller.headingText5.value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )),
        content: Column(
          children: <Widget>[
            Text(controller.SubHeadingText5.value,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
        isActive: _currentStep >= 4,
        state: StepState.complete,
      ),
    ];
    return _steps;
  }

  Widget _Track(context, index) {
    MyOrderScreenController Ordercontrollers = Get.put(MyOrderScreenController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Image.asset(
        'assets/images/mapImage.png',
        fit: BoxFit.contain,
        width: width * 0.9,
        height: height * 0.7,
      ),
    );
  }
}
