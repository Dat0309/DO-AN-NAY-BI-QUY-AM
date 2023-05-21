import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/data_plant.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/appbar_widget.dart';
import 'package:plant_identification_app/widgets/list_plant.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgricultureController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.heightPadding20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppBarWidget(
                    leftWidget: GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: SizedBox(
                        height: Dimensions.iconSize24,
                        child: Image.asset(
                          AssetHelper.icArrowBack,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    centerWidget: Text(
                      AppConstants.popular,
                      style:
                          TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                    ),
                  ),
                  controller.isLoadAgricultures
                      ? ListPlantWidget(
                          plants: controller.agricultures,
                          countItem: controller.agricultures.length)
                      : Container()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
