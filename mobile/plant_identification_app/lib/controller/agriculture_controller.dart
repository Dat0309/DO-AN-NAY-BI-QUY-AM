import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_identification_app/models/agriculture_recognition_model.dart';
import 'package:plant_identification_app/service/repository/agriculture_repo.dart';
import 'dart:convert';

class AgricultureController extends GetxController {
  final AgricultureRepo agricultureRepo;
  AgricultureController({required this.agricultureRepo});

  bool isRecognition = false;

  Future<Map<String, dynamic>> recognition(AssetImage image) async {
    var result;

    await agricultureRepo.agricultureRecognition(image).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);
        AgricultureRecognition agricultureRecognition =
            AgricultureRecognition.fromMap(resData['result'][0]);

        isRecognition = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'agriculture': agricultureRecognition.common_name,
        };

        update();
      } else {
        result = {
          'status': false,
          'code': value.statusCode,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }
}
