import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grosshop/ApiConfig/service/settings/get_profile_api_service.dart';
import 'package:grosshop/ApiConfig/service/settings/get_update_api_service.dart';
import 'package:grosshop/Models/settings/profile_model.dart';
import 'package:dio/dio.dart'as dio;
import 'package:grosshop/Models/settings/profile_update_model.dart';
import 'package:motion_toast/motion_toast.dart';

class SettingsController extends GetxController {

RxBool isLoading = false.obs;

GetProfileApiService  getprofileapiservice = GetProfileApiService();
 ProfileData? profiledata;

 getprofile({required String customerId})async{

  isLoading(true);
  dio.Response<dynamic> response = await getprofileapiservice.getprofileApi(coustomerId: customerId);

  isLoading(false);
  if(response.statusCode==200){
    ProfileModel profilemodel = ProfileModel.fromJson(response.data);
    profiledata = profilemodel.data;
    update();
  }
  else{
   _showErrorToast(response.statusMessage.toString());
  }

 }
//profile update

GetUpdateApiService getupdateapiservice = GetUpdateApiService();

getupdateprofile({required ProfileUpdateModel profileupdatemodel})async{
  isLoading(true);
  dio.Response<dynamic> response = await getupdateapiservice.getupdateApi(profileupdatemodel: profileupdatemodel);

  isLoading(false);
  if(response.statusCode==200){
    _showErrorToast(response.statusMessage.toString());
  }else{
    _showErrorToast(response.statusMessage.toString());
  }
}

//messsage
 void _showErrorToast(String message) {
    final context = Get.context;
    if (context != null) {
      MotionToast.error(
        title: const Text("Error", style: TextStyle(color: Colors.black, fontSize: 14)),
        description: Text(message, style: const TextStyle(color: Colors.white, fontSize: 12)),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        borderRadius: 10,
        displaySideBar: false,
        enableAnimation: false,
      ).show(context);
    }
  }


}