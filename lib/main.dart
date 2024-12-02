import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grosshop/Components/AppTheme.dart';
import 'package:grosshop/Controller/LoginScreenController.dart';
import 'package:grosshop/Controller/cartItem/cartItem_controller.dart';
import 'package:grosshop/utility/AppPreference.dart';
import 'package:provider/provider.dart';

import 'Controller/offers_list_controller.dart';
import 'Pageroutes/App_pages.dart';
import 'Pageroutes/App_routes.dart';
import 'Provider/ProductProvider.dart';
import 'UI/SplashScreens/ScreenOne.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(OffersListController());
  Get.put(CartitemController());
  Get.put(LoginScreenController());
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  AppPreference().init();
  runApp(
    ChangeNotifierProvider<ProductProvider>(
      create: (_) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.Buttoncolor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Portrait mode only
    ]);

    final ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 4,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppTheme.Buttoncolor,
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const ScreenOne() /*LoginScreen()*/,
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
    );
  }
}
