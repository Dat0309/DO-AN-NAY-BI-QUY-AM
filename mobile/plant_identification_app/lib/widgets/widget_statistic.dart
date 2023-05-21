// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';

class StatisticWidget extends StatefulWidget {
  final String title;
  final int count;
  final List<Agriculture> agriculture;
  final Color color;
  const StatisticWidget({
    Key? key,
    required this.title,
    required this.count,
    required this.agriculture,
    required this.color,
  }) : super(key: key);

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.widthPadding10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: widget.color.withOpacity(0.35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
            ),
            height: Dimensions.height140,
            width: Dimensions.screenWidth,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.agriculture.length,
              itemBuilder: (context, index) => SizedBox(
                width: Dimensions.widthPadding60,
                height: Dimensions.height200,
                child: Image.network(
                  widget.agriculture[index].image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(Dimensions.widthPadding10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.black.withOpacity(0.35)),
              child: Center(
                  child: Text(
                "${widget.title}: ${widget.count}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.iconSize24,
                  fontWeight: FontWeight.bold
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
