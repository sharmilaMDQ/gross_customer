import 'package:grosshop/Models/offerslist_model/offers_click_model.dart';

import '../Models/GetCustomerAddressResponseModel.dart';

class Helper {

  static int customerID = 0;
  static dynamic productID = 0;
  static String location = "";
  static String deliveryPlace = "Home";
  static String rating = "0";
  static String offerPrice = "0";
  static String orderMode = "Pickup";
  static String offerType = "";
  static String offerSellerType = "";
  static String contentId = "";
  static String pickUPTime = "";
  static bool offerState = false;
  static List<OffersClickData>? offerData = [];
  static List<GetCustomerAddresses>? customerAddress = [];

  static dynamic coustomerprofile = "";

}