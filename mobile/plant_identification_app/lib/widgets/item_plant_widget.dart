import 'package:flutter/material.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/teststyle_constants.dart';
import '../helper/image_helper.dart';

class ItemPlantWidget extends StatelessWidget {
  const ItemPlantWidget({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        // Navigator.of(context)
        //     .pushNamed(HotelBookingScreen.routeName, arguments: name);
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.widthPadding15 + 1),
        
        child: Stack(children: [
          ImageHelper.loadFromAsset(
            image,
            width: Dimensions.width150,
            height: Dimensions.height200,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(Dimensions.widthPadding10),
          ),
          Positioned(
            right: Dimensions.widthPadding5,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.widthPadding15 + 1),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            left: Dimensions.widthPadding15 + 1,
            bottom: Dimensions.widthPadding10 + 5,
            child: Container(
              padding: EdgeInsets.all(Dimensions.widthPadding5 + 2),
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.4),
                borderRadius: BorderRadius.circular(Dimensions.radius8)
              ),
              child: Text(
                  name,
                  style: TextStyles.defaultStyle.whiteTextColor.bold,
                ),
            )
          ),
        ]),
      ),
    );
  }
}
