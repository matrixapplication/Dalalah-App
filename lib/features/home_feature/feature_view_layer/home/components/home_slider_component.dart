
import 'package:arabitac/core/resources/values_manager.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/slider_widget.dart';
import 'package:flutter/material.dart';


class HomeSliderComponent extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  const HomeSliderComponent({
    Key? key,
    required this.drawerKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: deviceHeight * 0.33,
      width: double.infinity,
      child: BuildSliderComponent(drawerKey: drawerKey),
    );
  }
}
