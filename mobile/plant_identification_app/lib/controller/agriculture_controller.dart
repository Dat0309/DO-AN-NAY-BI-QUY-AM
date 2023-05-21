import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/models/agriculture_recognition_model.dart';
import 'package:plant_identification_app/service/repository/agriculture_repo.dart';
import 'dart:convert';

class AgricultureController extends GetxController {
  final AgricultureRepo agricultureRepo;
  AgricultureController({required this.agricultureRepo});

  bool isRecognition = false;
  bool isLoadAllAgricultureByType = false;
  bool isLoadAgricultures = false;

  List<Agriculture> agricultures = [];
  List<AgricultureRecognition> agricultureRecogs = [];
  List<Agriculture> leafAgriculture = [];
  List<Agriculture> fruitAgriculture = [];
  List<Agriculture> flowerAgriculture = [];
  List<Agriculture> barkAgriculture = [];

  Future<Map<String, dynamic>> recognition(PickedFile imgLeaf,
      PickedFile imgFlower, PickedFile imgFruit, PickedFile imgBark) async {
    isRecognition = false;
    var result;

    await agricultureRepo
        .agricultureRecognition(imgLeaf, imgFlower, imgFruit, imgBark)
        .then((value) async {
      print(value.data);
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = value.data;

        for (var e in resData['results']) {
          agricultureRecogs.add(AgricultureRecognition.fromMap(e));

          await agricultureRepo
              .getAgricultureByName(e['common_name'])
              .then((value2) {
            if (value2.statusCode == 200) {
              final Map<String, dynamic> resData2 = json.decode(value2.body);
              for (var agri in resData2['agriculture']) {
                agricultures.add(Agriculture.fromMap(agri));
              }
            }
          });
        }

        isRecognition = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'data': {
            'agriculturesRecognitions': agricultureRecogs,
            'agricultures': agricultures
          }
        };

        update();
      } else {
        result = {
          'status': false,
          'code': value.statusCode,
          'error': value.data,
        };
        update();
      }
    });
    return result;
  }

  Future<void> getAgricultures() async {
    isLoadAgricultures = false;
    await agricultureRepo.getAgricultures().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        for (int i = 0; i < res['agricultures'].length; i++) {
          agricultures.add(Agriculture.fromMap(res['agricultures'][i]));
        }
        isLoadAgricultures = true;
        update();
      }
    });
  }

  Future<void> getAgricultureByType() async{
    isLoadAllAgricultureByType = false;
    await agricultureRepo.getAgricultureByType(AppConstants.typeLeaf).then((value){
      print(value.body);
      if(value.statusCode == 200){
        final Map<String, dynamic> res = json.decode(value.body);

        for(int i=0; i<res['agricultures'].length; i++){
          leafAgriculture.add(Agriculture.fromMap(res['agricultures'][i]));
        }
        update();
      }
    });
    await agricultureRepo.getAgricultureByType(AppConstants.typeFruit).then((value){
       print(value.body);
      if(value.statusCode == 200){
        final Map<String, dynamic> res = json.decode(value.body);

        for(int i=0; i<res['agricultures'].length; i++){
          fruitAgriculture.add(Agriculture.fromMap(res['agricultures'][i]));
        }
        update();
      }
    });
    await agricultureRepo.getAgricultureByType(AppConstants.typeFlower).then((value){
       print(value.body);
      if(value.statusCode == 200){
        final Map<String, dynamic> res = json.decode(value.body);

        for(int i=0; i<res['agricultures'].length; i++){
          flowerAgriculture.add(Agriculture.fromMap(res['agricultures'][i]));
        }
        update();
      }
    });


    if(leafAgriculture.isNotEmpty && fruitAgriculture.isNotEmpty && flowerAgriculture.isNotEmpty){
      isLoadAllAgricultureByType = true;
      update();
    }
  }
}
