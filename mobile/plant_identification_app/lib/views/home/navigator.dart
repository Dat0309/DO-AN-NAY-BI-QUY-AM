import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_identification_app/constants/color_constants.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/favourite/favourite_screen.dart';
import 'package:plant_identification_app/views/home/home_screen.dart';
import 'package:plant_identification_app/views/other/detail_plant_screen.dart';
import 'package:plant_identification_app/views/scan/pick_image_screen.dart';
import 'package:plant_identification_app/views/settings/user_settings_screen.dart';

import '../../constants/teststyle_constants.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var curIndex = 0;
  List pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    Container(),
    const SettingDetailScreen()
  ];

  List<String> listOfNamePages = [
    '  Home',
    'Favourite',
    'Notification',
    '  Settings',
  ];

  List<IconData> lisOfIconsPages = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.solidBell,
    FontAwesomeIcons.solidUser
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            pages[curIndex],
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimensions.widthPadding20),
        height: 64,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: ColorPalette.colorShadow,
                  blurRadius: 16,
                  offset: Offset(4, 0)),
              BoxShadow(
                  color: ColorPalette.colorShadow,
                  blurRadius: 16,
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.circular(Dimensions.radius15 + 1)),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding10),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                curIndex = index;
                final test = Dimensions.widthPadding10;
                debugPrint('width: $test');
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == curIndex
                      ? Dimensions.widthPadding100 + 25
                      : Dimensions.widthPadding60 + 7.5,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == curIndex ? Dimensions.heightPadding45 : 0,
                    width:
                        index == curIndex ? Dimensions.widthPadding100 + 20 : 0,
                    decoration: BoxDecoration(
                      color: index == curIndex
                          ? ColorPalette.primaryColor.withOpacity(0.4)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  //width: index == curIndex ? 120 : 60,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == curIndex
                                ? Dimensions.widthPadding40
                                : 0,
                          ),
                          AnimatedOpacity(
                              opacity: index == curIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: index == curIndex
                                  ? Text(
                                      listOfNamePages[index],
                                      style: TextStyles.defaultStyle.bold
                                          .copyWith(
                                              color: ColorPalette.secondColor),
                                    )
                                  : const Text('')),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == curIndex
                                ? Dimensions.widthPadding15
                                : Dimensions.widthPadding20,
                          ),
                          Icon(
                            lisOfIconsPages[index],
                            size: 18,
                            color: index == curIndex
                                ? ColorPalette.secondColor
                                : ColorPalette.colorIcon,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
