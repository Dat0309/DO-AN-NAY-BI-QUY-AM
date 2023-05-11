// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

import '../constants/teststyle_constants.dart';

class TextFieldCustom2 extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int? maxLine;
  final bool? typeField;
  

  const TextFieldCustom2({
    Key? key,
    required this.hint,
    required this.controller,
    this.maxLine,
    required this.typeField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.widthPadding10, top: Dimensions.widthPadding5),
      alignment: Alignment.center,
      height: typeField!
          ? Dimensions.heightPadding45 + 15
          : Dimensions.screenHeight / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: Colors.white,
        boxShadow: [BoxShadows.defaultBoxShadow],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: maxLine ?? 1,
              cursorColor: Colors.white70,
              keyboardType: TextInputType.emailAddress,
              style: TextStyles.defaultStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyles.defaultStyle.copyWith(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
