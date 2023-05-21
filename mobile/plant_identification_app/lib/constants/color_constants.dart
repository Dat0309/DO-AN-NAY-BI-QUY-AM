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
  static const Color colorBgItem = Color(0xffF0F3F6);

  static const Color textColors = Color(0xff484848);

  static const Color green = Color(0xff4B8364);
  static const Color blue = Color(0xff5676DC);
  static const Color pupler = Color(0xffA559D9);
  static const Color orange = Color(0xffE6B44C);

  static const Color a = Color(0xffE0E5DF);
  static const Color b = Color(0xffFFC2BF);
  static const Color c = Color(0xffFAEAA9);
  static const Color d = Color(0xffB2EDBB);
  static const Color e = Color(0xffF2E5D8);
  static const Color f = Color(0xffB6D9FF);
  static const Color g = Color(0xffFAD0A9);
  static const Color h = Color(0xffC8BFFF);
  static const Color j = Color(0xffB2EDE6);
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
    blurRadius: 8,
    offset: Offset(4, 4),
  );
}
