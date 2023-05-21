import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_identification_app/models/agricukture_model.dart';
import 'package:plant_identification_app/ultils/dimensions.dart';
import 'package:plant_identification_app/widgets/item_plant_widget.dart';

class ListPlantWidget extends StatefulWidget {
  const ListPlantWidget({
    super.key,
    required this.plants,
    required this.countItem,
  });

  final List<Agriculture> plants;
  final int countItem;

  @override
  State<ListPlantWidget> createState() => _ListPlantWidgetState();
}

class _ListPlantWidgetState extends State<ListPlantWidget> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.widthPadding15,
        right: Dimensions.widthPadding15,
      ),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.countItem,
        crossAxisCount: 4,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: ItemPlantWidget(
            agriculture: widget.plants[index],
          ),
        ),
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
      ),
    );
  }
}
