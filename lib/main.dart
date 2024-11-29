import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grosshop/Components/AppTheme.dart';
import 'package:grosshop/Controller/offers_list_controller.dart/offers_list_controller.dart';
import 'package:grosshop/utility/AppPreference.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'Pageroutes/App_pages.dart';
import 'Pageroutes/App_routes.dart';
import 'Provider/ProductProvider.dart';
import 'UI/SplashScreens/ScreenOne.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(OffersListController());
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      home: const ScreenOne(),  // You can change this to LoginScreen() if needed
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ta', 'IN'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }
}
