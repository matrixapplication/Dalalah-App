import 'package:flutter/material.dart';

import '../../../../core/widgets/list-tile/custom_list_tile2.dart';

class ListTileSettings extends StatelessWidget {
  const ListTileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile2(
      title: 'Settings',
      onTap: () {},
      isArrowForward: true,
    );
  }
}
