import 'package:flutter/cupertino.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

class AppBarWidget extends StatefulWidget {
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? centerWidget;

  const AppBarWidget(
      {Key? key, this.leftWidget, this.rightWidget, this.centerWidget})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 0, bottom: Dimensions.widthPadding15),
      width: Dimensions.screenWidth,
      height: Dimensions.heightPadding60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.leftWidget ?? Container(),
          widget.centerWidget ?? Container(),
          widget.rightWidget ?? Container(),
        ],
      ),
    );
  }
}
