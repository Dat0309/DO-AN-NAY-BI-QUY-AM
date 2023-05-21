import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/constants/data_category.dart';
import 'package:plant_identification_app/constants/data_plant.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/controller/agriculture_controller.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/category/category_screen.dart';
import 'package:plant_identification_app/views/home/widget/list_category.dart';
import 'package:plant_identification_app/views/popular/popular_screen.dart';
import 'package:plant_identification_app/views/scan/pick_image_screen.dart';
import 'package:plant_identification_app/widgets/appbar_widget.dart';
import 'package:plant_identification_app/widgets/list_plant.dart';
import 'package:plant_identification_app/widgets/widget_statistic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgricultureController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppBarWidget(
              leftWidget: SizedBox(
                height: Dimensions.iconSize24 + 6,
                child: Image.asset(
                  AssetHelper.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.widthPadding15,
                  right: Dimensions.widthPadding15),
              child: GestureDetector(
                onTap: () {
                  Get.to(const PickImageScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.heightPadding15,
                      horizontal: Dimensions.widthPadding15),
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(Dimensions.radius8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Dimensions.iconSize24,
                        child: Image.asset(AssetHelper.iconScan),
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding15,
                      ),
                      Text(
                        AppConstants.scan,
                        style: TextStyles.defaultStyle.bold.copyWith(
                            color: ColorPalette.secondColor, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.heightPadding20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AssetHelper.icGallery,
                    height: 24, fit: BoxFit.cover),
                SizedBox(
                  width: Dimensions.widthPadding10,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.widthPadding10),
                  child: Text(
                    AppConstants.popular,
                    style: TextStyles.defaultStyle.bold.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthPadding100 + 55,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const PopularScreen());
                  },
                  child: SizedBox(
                      height: Dimensions.iconSize24 + 20,
                      child: Image.asset(AssetHelper.icArrow)),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.heightPadding15,
            ),
            controller.isLoadAgricultures
                ? ListPlantWidget(
                    plants: controller.agricultures,
                    countItem: 4,
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AssetHelper.icCategory,
                    height: 24, fit: BoxFit.cover),
                SizedBox(
                  width: Dimensions.widthPadding10,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.widthPadding10),
                  child: Text(
                    AppConstants.category,
                    style: TextStyles.defaultStyle.bold.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthPadding100 + 65,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CategoriesScreen());
                  },
                  child: SizedBox(
                      height: Dimensions.iconSize24 + 20,
                      child: Image.asset(AssetHelper.icArrow)),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.heightPadding15,
            ),
            ListCategory(categorys: categories),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AssetHelper.icCategory,
                    height: 24, fit: BoxFit.cover),
                SizedBox(
                  width: Dimensions.widthPadding10,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.widthPadding10),
                  child: Text(
                    AppConstants.statistic,
                    style: TextStyles.defaultStyle.bold.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.heightPadding15,
            ),
            controller.isLoadAllAgricultureByType
                ? Column(
                    children: [
                      StatisticWidget(
                          title: AppConstants.leaf,
                          count: 42,
                          agriculture: controller.leafAgriculture,
                          color: Colors.green),
                      StatisticWidget(
                          title: AppConstants.flower,
                          count: 55,
                          agriculture: controller.flowerAgriculture,
                          color: Colors.pink),
                      StatisticWidget(
                          title: AppConstants.fruit,
                          count: 40,
                          agriculture: controller.fruitAgriculture,
                          color: Colors.yellow),
                    ],
                  )
                : Container()
          ]),
        ),
      );
    });
  }
}
