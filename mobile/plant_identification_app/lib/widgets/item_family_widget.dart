import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/app_constants.dart';
import '../constants/teststyle_constants.dart';

class ItemFamily extends StatefulWidget {
  final String data;
  const ItemFamily({super.key, required this.data});

  @override
  State<ItemFamily> createState() => _ItemFamilyState();
}

class _ItemFamilyState extends State<ItemFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius8 - 2),
        color: ColorPalette.colorBgItem,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          widget.data,
          style: TextStyles.defaultStyle.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
