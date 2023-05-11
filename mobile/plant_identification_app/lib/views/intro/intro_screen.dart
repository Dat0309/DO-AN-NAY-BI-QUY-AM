
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/views/home/navigator.dart';
import 'package:plant_identification_app/views/intro/widget/item_intro_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/color_constants.dart';
import '../../constants/teststyle_constants.dart';
import '../../helper/asset_helper.dart';



class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    const ItemIntroWidget(
      title: 'Tổng quan',
      description: 'Một công cụ hữu ích cho người yêu thích nghề trồng trọt hay các chuyên gia nông nghiệp muốn xác định loài cây trong vườn của mình.',
      sourceImage: AssetHelper.intro1,
      aligment: Alignment.centerRight,
    ),
    const ItemIntroWidget(
      title: 'Công cụ hữu ích',
      description: 'Bạn có bao giờ tự hỏi cây trồng trong vườn hay cảnh quan xung quanh là loại gì không? Ứng dụng nhận diện cây trồng sẽ giúp bạn trả lời câu hỏi đó chỉ trong vài giây.',
      sourceImage: AssetHelper.intro2,
      aligment: Alignment.center,
    ),
    const ItemIntroWidget(
      title: 'Xác định loài cây',
      description: 'Đối với những người mới bắt đầu học về nghề trồng trọt, việc phân biệt các loài cây trở nên rất khó khăn. Ứng dụng nhận diện cây trồng sẽ giúp bạn dễ dàng nhận ra loài cây và tìm hiểu về nó.',
      sourceImage: AssetHelper.intro3,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: Dimensions.widthPadding25,
            right: Dimensions.widthPadding25,
            bottom: Dimensions.widthPadding25 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: Dimensions.widthPadding5,
                    dotHeight: Dimensions.widthPadding5,
                    activeDotColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Get.to( const NavigationPage());
                    } else {
                      _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.widthPadding25),
                      gradient: Gradients.defualtGradientBg
                    ),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding25 * 2, vertical: Dimensions.widthPadding15),
                    child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Tiếp' : 'Bắt đầu nào !',
                          style: TextStyles.defaultStyle.whiteTextColor.bold,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}