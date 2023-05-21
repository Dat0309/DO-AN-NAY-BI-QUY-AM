import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_identification_app/constants/data_category.dart';
import 'package:plant_identification_app/widgets/item_category_widget2.dart';

class ListCategory2 extends StatefulWidget {
  final List<Map<String, dynamic>> categorys;
  const ListCategory2({super.key, required this.categorys});

  @override
  State<ListCategory2> createState() => _ListCategory2State();
}

class _ListCategory2State extends State<ListCategory2> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      crossAxisCount: 4,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: ItemCateogryWidget2(
          icon: widget.categorys[index]['icon'],
          color: widget.categorys[index]['color'],
          name: widget.categorys[index]['name'],
        ),
      ),
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      staggeredTileBuilder: (index) =>
          const StaggeredTile.count(2, 2),
    );
  }
}
