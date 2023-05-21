import 'package:flutter/material.dart';
import 'package:plant_identification_app/constants/data_category.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/item_category_widget.dart';


class ListCategory extends StatefulWidget {
  const ListCategory({super.key, required this.categorys});


  final List<Map<String, dynamic>> categorys;

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height120,
      width: Dimensions.screenWidth,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: ItemCategoryWidget(
                icon: widget.categorys[index]['icon'],
                color: widget.categorys[index]['color'],
                name: widget.categorys[index]['name'],
               
              ),
            ),
          ),
        );
  }
}