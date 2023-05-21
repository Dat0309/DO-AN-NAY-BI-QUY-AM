import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/controller/pick_image_controller.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/scan/resutl_screen.dart';
import 'package:plant_identification_app/views/scan/scan_screen.dart';
import 'package:plant_identification_app/widgets/button_widget.dart';

import '../../widgets/appbar_widget.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  bool setStateLoading = true;
  void recognition(AgricultureController agricultureController,
      PickImageController pickImgController) async {
    // ignore: deprecated_member_use
    // loading o day ne
    await agricultureController
        .recognition(pickImgController.imgLeaf!, pickImgController.imgFlower!,
            pickImgController.imgFruit!, pickImgController.imgBark!)
        .then((value) {
      if (value['status']) {
        // tat loading o day ne
        Get.to(() => const ResutlScreen());
      } else {
        Get.snackbar(
          value['code'],
          value['error'],
          backgroundColor: Colors.green,
          colorText: Colors.black,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgricultureController>(builder: (agriController) {
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
                      AppConstants.pickImage,
                      style:
                          TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.widthPadding20),
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.widthPadding10),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: ColorPalette.green.withOpacity(0.2),
                      ),
                      child: const Text(
                        AppConstants.tutorial,
                        style: TextStyles.defaultStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.widthPadding20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButtonPickImageLeaf(),
                            SizedBox(
                              width: Dimensions.heightPadding30,
                            ),
                            buildButtonPickImageFruit()
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.heightPadding30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildButtonPickImageBark(),
                            SizedBox(
                              width: Dimensions.heightPadding30,
                            ),
                            buildButtonPickImageFlower(),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                        ),
                        ButtonWidget(
                          title: AppConstants.identified,
                          ontap: () {
                            recognition(agriController,
                                Get.find<PickImageController>());
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildButtonPickImageLeaf() {
    return GetBuilder<PickImageController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(const ScanScreen(
            type: 0,
          ));
        },
        child: DottedBorder(
            color: ColorPalette.primaryColor,
            strokeWidth: 3,
            radius: Radius.circular(Dimensions.radius15),
            dashPattern: const [10, 5],
            customPath: (size) {
              return Path()
                ..moveTo(Dimensions.radius15, 0)
                ..lineTo(size.width - Dimensions.radius15, 0)
                ..arcToPoint(Offset(size.width, Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(size.width, size.height - Dimensions.radius15)
                ..arcToPoint(
                    Offset(size.width - Dimensions.radius15, size.height),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(Dimensions.radius15, size.height)
                ..arcToPoint(Offset(0, size.height - Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(0, Dimensions.radius15)
                ..arcToPoint(Offset(Dimensions.radius15, 0),
                    radius: Radius.circular(Dimensions.radius15));
            },
            child: SizedBox(
              height: Dimensions.height140 + 30,
              width: Dimensions.widthPadding100 + 30,
              child: SizedBox(
                height: Dimensions.iconSize24,
                child: controller.imgLeaf == null
                    ? Image.asset(
                        AssetHelper.iconLeaf,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image: FileImage(File(controller.imgLeaf!.path)),
                              fit: BoxFit.cover,
                            )),
                      ),
              ),
            )),
      );
    });
  }

  Widget buildButtonPickImageFruit() {
    return GetBuilder<PickImageController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(const ScanScreen(
            type: 1,
          ));
        },
        child: DottedBorder(
            color: ColorPalette.primaryColor,
            strokeWidth: 3,
            radius: Radius.circular(Dimensions.radius15),
            dashPattern: const [10, 5],
            customPath: (size) {
              return Path()
                ..moveTo(Dimensions.radius15, 0)
                ..lineTo(size.width - Dimensions.radius15, 0)
                ..arcToPoint(Offset(size.width, Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(size.width, size.height - Dimensions.radius15)
                ..arcToPoint(
                    Offset(size.width - Dimensions.radius15, size.height),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(Dimensions.radius15, size.height)
                ..arcToPoint(Offset(0, size.height - Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(0, Dimensions.radius15)
                ..arcToPoint(Offset(Dimensions.radius15, 0),
                    radius: Radius.circular(Dimensions.radius15));
            },
            child: SizedBox(
              height: Dimensions.height140 + 30,
              width: Dimensions.widthPadding100 + 30,
              child: SizedBox(
                height: Dimensions.iconSize24,
                child: controller.imgFruit == null
                    ? Image.asset(
                        AssetHelper.iconFruit,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image: FileImage(File(controller.imgFruit!.path)),
                              fit: BoxFit.cover,
                            )),
                      ),
              ),
            )),
      );
    });
  }

  Widget buildButtonPickImageFlower() {
    return GetBuilder<PickImageController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(const ScanScreen(
            type: 2,
          ));
        },
        child: DottedBorder(
            color: ColorPalette.primaryColor,
            strokeWidth: 3,
            radius: Radius.circular(Dimensions.radius15),
            dashPattern: const [10, 5],
            customPath: (size) {
              return Path()
                ..moveTo(Dimensions.radius15, 0)
                ..lineTo(size.width - Dimensions.radius15, 0)
                ..arcToPoint(Offset(size.width, Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(size.width, size.height - Dimensions.radius15)
                ..arcToPoint(
                    Offset(size.width - Dimensions.radius15, size.height),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(Dimensions.radius15, size.height)
                ..arcToPoint(Offset(0, size.height - Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(0, Dimensions.radius15)
                ..arcToPoint(Offset(Dimensions.radius15, 0),
                    radius: Radius.circular(Dimensions.radius15));
            },
            child: SizedBox(
              height: Dimensions.height140 + 30,
              width: Dimensions.widthPadding100 + 30,
              child: SizedBox(
                height: Dimensions.iconSize24,
                child: controller.imgFlower == null
                    ? Image.asset(
                        AssetHelper.iconFlower,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image:
                                  FileImage(File(controller.imgFlower!.path)),
                              fit: BoxFit.cover,
                            )),
                      ),
              ),
            )),
      );
    });
  }

  Widget buildButtonPickImageBark() {
    return GetBuilder<PickImageController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.to(const ScanScreen(
            type: 3,
          ));
        },
        child: DottedBorder(
            color: ColorPalette.primaryColor,
            strokeWidth: 3,
            radius: Radius.circular(Dimensions.radius15),
            dashPattern: const [10, 5],
            customPath: (size) {
              return Path()
                ..moveTo(Dimensions.radius15, 0)
                ..lineTo(size.width - Dimensions.radius15, 0)
                ..arcToPoint(Offset(size.width, Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(size.width, size.height - Dimensions.radius15)
                ..arcToPoint(
                    Offset(size.width - Dimensions.radius15, size.height),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(Dimensions.radius15, size.height)
                ..arcToPoint(Offset(0, size.height - Dimensions.radius15),
                    radius: Radius.circular(Dimensions.radius15))
                ..lineTo(0, Dimensions.radius15)
                ..arcToPoint(Offset(Dimensions.radius15, 0),
                    radius: Radius.circular(Dimensions.radius15));
            },
            child: SizedBox(
              height: Dimensions.height140 + 30,
              width: Dimensions.widthPadding100 + 30,
              child: SizedBox(
                height: Dimensions.iconSize24,
                child: controller.imgBark == null
                    ? Image.asset(
                        AssetHelper.iconBark,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image: FileImage(File(controller.imgBark!.path)),
                              fit: BoxFit.cover,
                            )),
                      ),
              ),
            )),
      );
    });
  }
}
