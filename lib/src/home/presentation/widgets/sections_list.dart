import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../domain/entities/section.dart';

///  Created by harbey on 10/10/2023.
class SectionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Section> sections = Section.getSections(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sections.length,
      itemBuilder: (context, index) => SectionsItem(section: sections[index]),
    );
  }
}


class SectionsItem extends StatelessWidget {
  final Section section;
  const SectionsItem({Key? key, required this.section}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.paddingAll,
      decoration: Decorations.kDecorationBorderRadius(),
      child: Column(
        children: [
          Image.asset(section.image),
          Text(section.title)
        ],
      ),
    );
  }
}