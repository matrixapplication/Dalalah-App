import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 9/6/2023.
class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  CustomExpansionTile({required this.title, required this.children});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: context.bodyLarge,
      ),
      iconColor: context.primaryColor,
      collapsedIconColor: context.primaryColor,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      children: children,
    );
  }
}
