import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/controller/pick_image_controller.dart';
import 'package:plant_identification_app/helper/local_storage_helper.dart';

import 'package:plant_identification_app/views/intro/splash_screen.dart';

import 'constants/color_constants.dart';

import 'helper/dependentcies.dart' as dep;

void main() async {
 // await Hive.initFlutter();
  await Hive.initFlutter();
  await LocalSrorageHelper.initLocalStorageHelper();


  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
 
  await dep.AppDependentcies.init();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.find<AgricultureController>().getAgricultures();
    Get.find<AgricultureController>().getAgricultureByType();
    Get.find<PickImageController>();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Plant Identification App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.bgScaffoldColor,
        backgroundColor: ColorPalette.bgScaffoldColor,
      ),
      // routes: routes,
      //onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
