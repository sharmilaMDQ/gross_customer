import 'dart:io';

import 'package:dio/dio.dart';
import 'package:grosshop/ApiConfig/ApiUrl.dart';
import 'package:grosshop/Models/settings/profile_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUpdateApiService extends ApiUrl {

  Future getupdateApi({required ProfileUpdateModel profileupdatemodel})async{
    dynamic responseJson;

    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("authtoken");
      FormData formData = FormData.fromMap({
        "customerId":profileupdatemodel.customerId,
        "customerMobile":profileupdatemodel.mobileNumber,
        "firstName":profileupdatemodel.name,
        "customerAddress":profileupdatemodel.address,
        "customerCity":profileupdatemodel.city,
        "customerState":profileupdatemodel.state,
        "customerCountry":profileupdatemodel.country,
        "customerPincode":profileupdatemodel.pincode,
        "customerEmail":profileupdatemodel.emailId,
        "customerImage":profileupdatemodel.image
      });
      var response = await dio.post(ApiUrl.getupdateprofileUrl,
      options: Options(
        headers: {
          "Accept":"application/json",
          "x-api-key": "655f636f6d6d657263655f6d6f62696c65"
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      ),
      data: formData
      );
      print(':::::::::Get Update profile Api Service::::::::::<status code>::::::::::');
      print(response.statusCode);
      print(response.data);
      responseJson = response;

    }
    on SocketException{
      print('no internet');
    }
    return responseJson;
  }
}