// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/controller/pick_image_controller.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/scan/pick_image_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';


class ScanScreen extends StatefulWidget {
  final int? type;
  const ScanScreen({super.key, this.type});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey _scanKey = GlobalKey(debugLabel: "QR");

  QRViewController? _controller;
  Barcode? result;
  File? file;
  ImagePicker image = ImagePicker();
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgricultureController>(builder: (agricultureController) {
      return Scaffold(
        body: SizedBox(
          width: Dimensions.screenWidth,
          height: Dimensions.screenHeight,
          child: Stack(
            children: [
              _buildScanView(context),
              Positioned(
                top: Dimensions.heightPadding60,
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.widthPadding15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Dimensions.iconSize24 + 10,
                        child: Image.asset(
                          AssetHelper.iconflashOff,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        AppConstants.scan,
                        style: TextStyles.defaultStyle.bold
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SizedBox(
                          height: Dimensions.iconSize24 + 20,
                          child: Image.asset(
                            AssetHelper.iconExit,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: Dimensions.heightPadding45,
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.widthPadding15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                         getall();
                           
                        },
                        child: SizedBox(
                          height: Dimensions.iconSize24 + 20,
                          child: Image.asset(
                            AssetHelper.iconPupularCamera,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                     GestureDetector(
                      onTap: () {
                        getcam();
                      },
                        child: SizedBox(
                          height: Dimensions.iconSize50 + 20,
                          child: Image.asset(
                            AssetHelper.iconCamera,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.iconSize24 + 20,
                        child: Image.asset(
                          AssetHelper.iconRotate,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ignore: unused_element
  Widget _buildScanView(BuildContext context) {
    return QRView(
      key: _scanKey,
      onQRViewCreated: onQRViewCreated,
      onPermissionSet: (crtl, p) => onPermissionSet(context, crtl, p),
    );
  }

  


  void onQRViewCreated(QRViewController _qrController) {
    setState(() {
      // ignore: unnecessary_this
      this._controller = _qrController;
    });

    _controller?.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        _controller?.pauseCamera();
      });
    });
  }

  void onPermissionSet(
      BuildContext context, QRViewController _ctrl, bool _permission) {
    if (!_permission) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No Permission')));
    }
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
    switch (widget.type!){
      case 0:
        Get.find<PickImageController>().saveImg(0, img!);
        break;
      case 1:
        Get.find<PickImageController>().saveImg(1, img!);
        break;
      case 2:
        Get.find<PickImageController>().saveImg(2, img!);
        break;
      case 3:
        Get.find<PickImageController>().saveImg(3, img!);
        break;
    }
    Get.to(() => PickImageScreen());
  }

  getall() async {
    // ignore: deprecated_member_use
    PickedFile? img = await image.getImage(source: ImageSource.gallery);

    setState(() {
      file = File(img!.path);
      // ignore: avoid_print
      print(file);
    });
    switch (widget.type!){
      case 0:
        Get.find<PickImageController>().saveImg(0, img!);
        break;
      case 1:
        Get.find<PickImageController>().saveImg(1, img!);
        break;
      case 2:
        Get.find<PickImageController>().saveImg(2, img!);
        break;
      case 3:
        Get.find<PickImageController>().saveImg(3, img!);
        break;
    }
    Get.to(() => PickImageScreen());
    
  }
  }
