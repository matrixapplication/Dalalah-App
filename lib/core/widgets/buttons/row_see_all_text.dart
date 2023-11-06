import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../src/cars/presentation/cars/pages/cars_page.dart';
import '../../themes/colors.dart';
import '../../utils/navigator.dart';

///  Created by harbey on 9/5/2023.
class RowSeeAllText extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String routeName;

  const RowSeeAllText({
    super.key,
    required this.title,
    this.onTap,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (10.paddingBottom + 16.paddingTop + 16.paddingHoriz),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.displaySmall!.copyWith(
              color: AppColors.grey_5c,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: onTap ??
                () {
                  Navigators.pushNamed(routeName,
                      arguments: CarsPageArgs(categoryName: title));
                },
            child: Text(
              context.strings.see_all,
              style: context.headlineSmall.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
