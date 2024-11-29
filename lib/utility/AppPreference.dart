import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'Grosh_Shop';
  static const _MOBILE_NUMBER = 'mobile_number';
  static const PRODUCT_ID = 'Product_ID';
  static const PRODUCT_NAME = 'Product_Name';
  static const ADDCART = 'Cart';
  static const USER_ID = '_USER_ID';
  static const SELLER_ID = '_SELLER_ID';
  static const PICK_UP = '_PICK_UP';
  static const DELIVERY = '_DELIVERY';
  final _storage = GetStorage(STORAGE_NAME);

  Future<void> init() async {
    await _storage.initStorage;
  }

  updateMobileNumber(String mobileNumber) {
    _storage.write(_MOBILE_NUMBER, mobileNumber);
  }

  String get mobileNumber {
    try {
      return _storage.read(_MOBILE_NUMBER);
    } catch (e) {
      return "";
    }
  }
 updatePicUp(String pickup) {
    _storage.write(PICK_UP, pickup);
  }

  String get pickup {
    try {
      return _storage.read(PICK_UP);
    } catch (e) {
      return "";
    }
  }
 updateDelivery(String delivery) {
    _storage.write(DELIVERY, delivery);
  }

  String get delivery {
    try {
      return _storage.read(DELIVERY);
    } catch (e) {
      return "";
    }
  }

  updateProductId(String mobileNumber) {
    _storage.write(PRODUCT_ID, mobileNumber);
  }

  String get ProductId {
    try {
      return _storage.read(PRODUCT_ID);
    } catch (e) {
      return "";
    }
  }

  updateUserId(String name) {
    _storage.write(USER_ID, name);
  }

  String get UserId {
    try {
      return _storage.read(USER_ID);
    } catch (e) {
      return "";
    }
  } updateSellerId(String name) {
    _storage.write(SELLER_ID, name);
  }

  String get SellerId {
    try {
      return _storage.read(SELLER_ID);
    } catch (e) {
      return "";
    }
  }

  updateproductName(String name) {
    _storage.write(PRODUCT_NAME, name);
  }

  String get ProductName {
    try {
      return _storage.read(PRODUCT_NAME);
    } catch (e) {
      return "";
    }
  }

  updateCartName(String name) {
    _storage.write(ADDCART, name);
  }

  String get AddCart {
    try {
      return _storage.read(ADDCART);
    } catch (e) {
      return "";
    }
  }

  clearData() {
    _storage.erase();
  }
}
