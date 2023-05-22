import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/home/navigator.dart';
import 'package:plant_identification_app/widgets/button_widget.dart';
import 'package:plant_identification_app/widgets/dashline_widget.dart';
import 'package:plant_identification_app/widgets/item_family_widget.dart';
import 'package:plant_identification_app/widgets/item_ingredient_widget.dart';

import '../../constants/teststyle_constants.dart';
import '../../helper/asset_helper.dart';


class DetailPlantScreen extends StatefulWidget {
  final Agriculture agriculture;
  const DetailPlantScreen({super.key, required this.agriculture});

  @override
  State<DetailPlantScreen> createState() => _DetailPlantScreenState();
}

class _DetailPlantScreenState extends State<DetailPlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned.fill(
          child: Image.network(widget.agriculture.image!, fit: BoxFit.cover,),
        ),
        Positioned(
            top: Dimensions.widthPadding25 * 3,
            left: Dimensions.widthPadding25,
            child: GestureDetector(
              onTap: (() {
                Get.back();
              }),
              child: Container(
                padding: EdgeInsets.all(Dimensions.widthPadding10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.widthPadding15))),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            )),
        Positioned(
            top: Dimensions.widthPadding25 * 3,
            right: Dimensions.widthPadding25,
            child: GestureDetector(
              onTap: (() {}),
              child: Container(
                padding: EdgeInsets.all(Dimensions.widthPadding10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.widthPadding15))),
                child: const Icon(
                  FontAwesomeIcons.heart,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            )),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widthPadding25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.widthPadding15 * 2),
                    topRight: Radius.circular(Dimensions.widthPadding15 * 2),
                  )),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: Dimensions.widthPadding15,
                    ),
                    child: Container(
                      height: Dimensions.heightPadding8 - 3,
                      width: Dimensions.widthPadding60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.widthPadding10)),
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.widthPadding15,
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.widthPadding300 + 40,
                                  child: Text(
                                    "${widget.agriculture.commonName!} (${widget.agriculture.specificName})",
                                    style: TextStyles.defaultStyle.fontHeader.bold
                                        .copyWith(fontSize: 24),
                                        overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            ItemFamily(data: widget.agriculture.family!),
                            const DashLineWidget(),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            Text(
                              AppConstants.description,
                              style: TextStyles.defaultStyle.bold
                                  .copyWith(fontSize: 22),
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            Text(
                              widget.agriculture.description!,
                              style: TextStyles.defaultStyle
                                  .copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            Text(
                              //mô tả viết ở đây
                              'Chi tiết',
                              style: TextStyles.defaultStyle
                                  .copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.widthPadding15),
                              child: Column(
                                children: [
                                  //them chiieu dai va rong o day
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children:  [
                                      ItemIngredientWidget(
                                        icon: AssetHelper.iconheight,
                                        color: ColorPalette.green,
                                        title: AppConstants.height,
                                        data: widget.agriculture.heightAndSpread!.split("x")[0],
                                      ),
                                      SizedBox(
                                        width: Dimensions.widthPadding40,
                                      ),
                                      ItemIngredientWidget(
                                        icon: AssetHelper.iconwidth,
                                        color: ColorPalette.pupler,
                                        title: AppConstants.spread,
                                        data: widget.agriculture.heightAndSpread!.split("x")[1],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.heightPadding20,
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      const ItemIngredientWidget(
                                        icon: AssetHelper.iconwater,
                                        color: ColorPalette.blue,
                                        title: AppConstants.light,
                                        data: 'Bình thường',
                                      ),
                                      SizedBox(
                                        width: Dimensions.widthPadding30 - 7,
                                      ),
                                      const ItemIngredientWidget(
                                        icon: AssetHelper.iconlight,
                                        color: ColorPalette.orange,
                                        title: AppConstants.humidity,
                                        data: '56%',
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                            ButtonWidget(
                                title: 'Về trang chủ', ontap: () {
                                  Get.to(const NavigationPage());
                                }),
                            SizedBox(
                              height: Dimensions.widthPadding15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
