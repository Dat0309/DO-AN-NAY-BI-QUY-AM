import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController{
  PickImageController();

  PickedFile? imgLeaf;
  PickedFile? imgFruit;
  PickedFile? imgFlower;
  PickedFile? imgBark;

  Future<dynamic> saveImg(int key, PickedFile img) async{
    switch (key){
      case 0:
        imgLeaf = img;
        update();
        break;
      case 1:
        imgFruit = img;
        update();
        break;
      case 2:
        imgFlower = img;
        update();
        break;
      case 3:
        imgBark = img;
        update();
        break;
    }
  }

}