import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../domain/entities/section.dart';

///  Created by harbey on 10/10/2023.
class SectionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Section> sections = Section.getSections(context);
    return Column(
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
          height: 120,
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
    return Container(
      padding: 15.paddingAll,
      margin: startPadding.paddingStart + 10.paddingEnd,
      width: 115,
      decoration: Decorations.kDecorationBorderRadius(
        radius: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.asset(
              section.image,
            ),
          ),
          10.ph,
          Text(
            // section.title,
            'السيارات',
            style: context.textTheme.headlineSmall!.copyWith(
              // fontSize: 14,
              // fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
