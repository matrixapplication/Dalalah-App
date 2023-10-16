import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/src/cars/presentation/cars/widgets/cars_vertical_item.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/cars_list.dart';
import '../../../sell_car/domain/entities/shipment.dart';

class FavoritesAndAdsScreen extends StatelessWidget {
  final List<String> favorites;

  const FavoritesAndAdsScreen({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GridView.builder(
    //   itemCount: favorites.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 0.68,
    //   ),
    //   padding: 16.paddingVert + 6.paddingHoriz,
    //   itemBuilder: (context, index) {
    //     return CarVert(index: index,
    //
    //     );
    //   },
    // );

    // return ListView.builder(
    //   padding: 15.paddingAll,
    //   itemCount: 5,
    //   itemBuilder: (context, index) {
    //     return const CarVerticalItem();
    //   },
    // );
    return 0.ph;
  }
}
