import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/views/home/home_screen.dart';
import 'package:plant_identification_app/views/home/navigator.dart';
import 'package:plant_identification_app/views/intro/intro_screen.dart';

import '../../helper/asset_helper.dart';
import '../../helper/image_helper.dart';
import '../../helper/local_storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalSrorageHelper.getValues('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(milliseconds: 1000));

    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      // ignore: use_build_context_synchronously
     
      Get.to(() => const NavigationPage());
    } else {
      LocalSrorageHelper.setValue('ignoreIntroScreen', true);
      // ignore: use_build_context_synchronously
      Get.to(() => const IntroScreen());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.imageBackgroundSplash,
              fit: BoxFit.fitWidth),
        )
      ],
    );
  }
}
