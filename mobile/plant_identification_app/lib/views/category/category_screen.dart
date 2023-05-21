

import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/data_category.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/category/widget/list_categories.dart';
import 'package:plant_identification_app/widgets/appbar_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
                  AppConstants.category,
                  style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                ),
              ),
              ListCategory2(categorys: categories)
            ],
          ),
        ),
      ),
      
      ),
    );
  }
}