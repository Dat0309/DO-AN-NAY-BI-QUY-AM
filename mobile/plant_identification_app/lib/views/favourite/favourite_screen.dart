import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/data_plant.dart';

import '../../constants/app_constants.dart';
import '../../constants/teststyle_constants.dart';
import '../../helper/asset_helper.dart';
import '../../ultils/dimensions.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/list_plant.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
                  AppConstants.favourite,
                  style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                ),
              ),
              ListPlantWidget(plants: plants, countItem: plants.length)
            ],
          ),
        ),
      ),
      
      ),
    );
  }
}