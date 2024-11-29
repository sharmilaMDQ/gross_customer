import 'package:intl/intl.dart';

class LocaleHelper {
  static String translateProductName(String productName) {
    switch (productName.toLowerCase()) {
      case "product1":
        return Intl.message('Product 1', name: 'product1', desc: 'Product name 1');
      case "product2":
        return Intl.message('Product 2', name: 'product2', desc: 'Product name 2');
      default:
        return productName; // Return original if no translation found
    }
  }
}
