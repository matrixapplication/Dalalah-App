import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'custom_radio_list_tile.dart';

class RadioGridList extends StatelessWidget {
  final List<RadioItem> items;
  final String groupValue;
  final Color? color;
  final int crossAxisCount;
  final void Function(RadioItem)? onChanged;
  const RadioGridList({
    super.key,
    required this.items,
    this.color,
    required this.groupValue,
    required this.onChanged,
    this.crossAxisCount = 2,
  });
  @override
  Widget build(BuildContext context) {
    String groupValue = this.groupValue;
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: 5.paddingVert,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            return
              Padding(
                padding: 60.paddingEnd,
                child: FittedBox(
                child: CustomRadioListTile(
                  title: item.title,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                    onChanged!(item);
                  },
                ),
                              ),
              );
          }).toList(),
        ),
      );
    });
  }
}

class RadioItem {
  final int value;
  final String title;
  final String tooltipMessage;
  RadioItem({required this.value, required this.title, this.tooltipMessage = ''});

  static listFrom(List items) {
    List<RadioItem> list = [];
    for (var item in items) {
      list.add(RadioItem(value: item.productId, title: item.storeName, tooltipMessage: item.tooltipMessage ?? ''));
    }
    return list;
  }
}
