import 'package:get/get.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/service/repository/agriculture_repo.dart';

class AppDependentcies {
  static Future<void> init() async {
    Get.lazyPut(() => AgricultureRepo());

    Get.lazyPut(() => AgricultureController(agricultureRepo: Get.find()));
  }
}
