import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/utils/navigator.dart';
import '../../domain/entities/section.dart';

///  Created by harby on 10/10/2023.
class SectionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Section> sections = Section.getSections(context);
    return Material(
      color: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: 15.paddingHoriz,
            child: Text(
              context.strings.sections,
              style: context.textTheme.displaySmall!.copyWith(
                color: AppColors.grey_5c,
              ),
            ),
          ),
          17.ph,
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sections.length,
              itemBuilder: (context, index) => SectionsItem(
                section: sections[index],
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionsItem extends StatelessWidget {
  final Section section;
  final int index;

  const SectionsItem({
    Key? key,
    required this.section,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startPadding = index == 0 ? 20 : 0;
    return GestureDetector(
      onTap: () => pushNamed(section.routeName),
      child: Container(
        margin: startPadding.paddingStart + 10.paddingEnd ,
        padding: 10.paddingVert,
        width: 100,
        decoration: Decorations.kDecorationBorderWithRadius(
          radius: 20,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CircleAvatar(
              backgroundColor: context.gray_E2,
              radius: 25,
            ),
            Padding(
              padding: 30.paddingBottom,
              child: Image.asset(
                section.image,
                height: 80,
                width: 80,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                section.title,
                style: context.bodySmall.copyWith(),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
