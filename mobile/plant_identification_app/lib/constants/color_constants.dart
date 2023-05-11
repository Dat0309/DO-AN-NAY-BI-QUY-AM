import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xffADD294);
  static const Color secondColor = Color(0xff61AF2B);
  static const Color yellowColor = Color(0xffFE9C5E);

  static const Color dividerColor = Color(0xffE5E7EB);
  static const Color text1Color = Color(0xff323B4B);
  static const Color subTitleColor = Color(0xff838383);
  static const Color bgScaffoldColor = Color(0xffF2F2F2);
  static const Color colorShadow = Color(0xffCCCCCC);
  static const Color colorIcon = Color(0xffA29EB6);

   static const Color textColors = Color(0xff484848);
}

class Gradients {
  static const Gradient defualtGradientBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [ColorPalette.secondColor, ColorPalette.primaryColor],
  );
}

class BoxShadows {
  static BoxShadow defaultBoxShadow = const BoxShadow(
    color: ColorPalette.colorShadow,
    blurRadius: 16,
    offset: Offset(0, 4),
  );
}
