import 'package:dalalah/src/real_estate/presentation/real_estate/widgets/real_estate_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRealEstateListWidget extends StatelessWidget {
  const CustomRealEstateListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RealStateItemWidget(),
          RealStateItemWidget(),
          RealStateItemWidget(),
          RealStateItemWidget(),
        ],
      ),
    );
  }
}
