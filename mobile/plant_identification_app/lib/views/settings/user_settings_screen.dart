import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/app_constants.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/constants/teststyle_constants.dart';
import 'package:plant_identification_app/helper/asset_helper.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/appbar_widget.dart';
import 'package:plant_identification_app/widgets/text_field_custom.dart';


class SettingDetailScreen extends StatefulWidget {
  const SettingDetailScreen({Key? key}) : super(key: key);

  @override
  State<SettingDetailScreen> createState() => _SettingDetailScreenState();
}

class _SettingDetailScreenState extends State<SettingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneNumberController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                leftWidget: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: Dimensions.iconSize24,
                    child: Image.asset(
                      AssetHelper.icArrowBack,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                centerWidget: Text(
                  AppConstants.changeInfo,
                  style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: Dimensions.height120 ,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AssetHelper.avt,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: Dimensions.widthPadding100 + 10 ,
                    child: Container( 
                      height: Dimensions.heightPadding45 + 10,
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        border: Border.all(color: ColorPalette.textColors, width: 1.5),
                        shape: BoxShape.circle,
                        
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Image.asset(
                          AssetHelper.iconEdit,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              Text(
                AppConstants.name,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              TextFieldCustom2(
                  hint: AppConstants.name,
                  controller: nameController,
                  typeField: true),
              SizedBox(
                height: Dimensions.heightPadding20,
              ),
              Text(
                AppConstants.email,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              TextFieldCustom2(
                  hint: AppConstants.email,
                  controller: emailController,
                  typeField: true),
              SizedBox(
                height: Dimensions.heightPadding20,
              ),
              Text(
                AppConstants.sdt,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              TextFieldCustom2(
                  hint: AppConstants.sdt,
                  controller: phoneNumberController,
                  typeField: true),
                  SizedBox(
                height: Dimensions.heightPadding20,
              ),
              Text(
                AppConstants.pass,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              Text(
                AppConstants.changePass,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18, color: ColorPalette.secondColor),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
