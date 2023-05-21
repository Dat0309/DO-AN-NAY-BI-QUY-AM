// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_identification_app/constants/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class AgricultureRepo extends GetxService {
  AgricultureRepo();

  Future<dio.Response> agricultureRecognition(PickedFile? imgLeaf,
      PickedFile? imgFlower, PickedFile? imgFruit, PickedFile? imgBark) async {
    dio.FormData formData = dio.FormData.fromMap({
      "leaf": await dio.MultipartFile.fromFile(
        imgLeaf!.path,
        filename: 'imgLeaf',
      ),
      "fruit": await dio.MultipartFile.fromFile(
        imgFruit!.path,
        filename: 'imgFruit',
      ),
      "flower": await dio.MultipartFile.fromFile(
        imgFlower!.path,
        filename: 'imgFlower',
      ),
      "bark": await dio.MultipartFile.fromFile(
        imgBark!.path,
        filename: 'imgLeaf',
      ),
    });
    // ignore: avoid_print

    dio.Dio dioRes = dio.Dio();

    dio.Response res = await dioRes.post(
      AppUrl.RECOGNITION,
      data: formData,
      options: dio.Options(headers: {
        "accept": "*/*",
        "Content-Type": "multipart/form-data",
      }),
    );
    print(res);
    return res;
  }

  Future<http.Response> getAgricultureByName(String name) async {
    http.Response res = await http.get(
      Uri.parse('${AppUrl.GET_AGRICULTURE_BY_SPECIFICNAME}?name=$name'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAgricultures() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_ALL_AGRICULTURE),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAgricultureByType(String typeId) async {
    http.Response res = await http.get(
      Uri.parse('${AppUrl.GET_AGTICULTURE_BY_TYPE}/$typeId'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
