import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grosshop/ApiConfig/service/offers/offers_list_api_service.dart';
import 'package:grosshop/Models/offerslist_model/offers_list_model.dart';

class OffersListController extends GetxController {
  RxBool isLoading = false.obs;

  OffersData? offersdata;

  OffersListApiService offerslistapiservice = OffersListApiService();

  getslideroffers() async {
    isLoading(true);

    dio.Response<dynamic> response = await offerslistapiservice.offerslistAPi();

    isLoading(false);
    if (response.statusCode == 200) {
      OfferesSliderModel offerslidermodel = await OfferesSliderModel.fromJson(response.data);
      offersdata = offerslidermodel.data;
      //  Fluttertoast.showToast(
      //   msg: response.statusMessage!,
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.black,
      //   textColor: Colors.white,
      // );
      update();
    } else {
      Fluttertoast.showToast(
        msg: response.statusMessage!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }
}
