import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/item_resutl.dart';

class ListResult extends StatefulWidget {
  const ListResult({super.key});

  @override
  State<ListResult> createState() => _ListResultState();
}

class _ListResultState extends State<ListResult> {

  double getTotalPercent(List<dynamic> agriRecog){
    double percent = 0;
    agriRecog.forEach((element) {
      percent += element['percent'] as double;
    });
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgricultureController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding15,
            right: Dimensions.widthPadding15,
          ),
          child: ListView.builder(
            itemCount: controller.agricultures.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: ItemResutl(
                agriculture: controller.agricultures[index],
                agricultureRecognition: controller.agricultureRecogs[index],
              ),
            ),
          ),
        );
      }
    );
  }
}
