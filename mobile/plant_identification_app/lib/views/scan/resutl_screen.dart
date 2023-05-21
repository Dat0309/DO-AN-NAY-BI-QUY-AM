

import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/list_result.dart';

import '../../helper/asset_helper.dart';
import '../../widgets/appbar_widget.dart';

class ResutlScreen extends StatelessWidget {
  const ResutlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.heightPadding20),
        child:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppBarWidget(
                leftWidget: GestureDetector(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: SizedBox(
                    height: Dimensions.iconSize24,
                    child: Image.asset(
                      AssetHelper.icArrowBack,
                      fit:  BoxFit.cover,
                    ),
                  ),
                ),
                centerWidget: Text(
                  AppConstants.resutl,
                  style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(
                height: Dimensions.height1000,
                child: const ListResult())
            ],
          ),
        ),
      ),
      
      ),
    );
  }
}