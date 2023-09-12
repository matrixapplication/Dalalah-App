import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive_service.dart';

class SelectionButtonChip extends StatelessWidget {
  final String? title;
  final List<ChipItem> types;
  final EdgeInsetsGeometry? padding;
  final void Function(bool)? onSelected;
  final bool isScrollable;

  SelectionButtonChip(
      {Key? key,
      this.title,
      required this.types,
      this.onSelected,
      this.padding,
      this.isScrollable = false,
      })
      : super(key: key);

  ChipItem? selectedType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        10.ph,
        StatefulBuilder(
          builder: (context, setState) {
            return isScrollable ?  _buildChips(context, setState) : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: types
                  .map((item) => Expanded(
                child: SelectItem(
                  item: item,
                  types: types,
                  setState: setState,
                  selectedType: selectedType ?? types.first,
                  onSelected: (bool value) {
                    setState(() {
                      selectedType = item;
                      onSelected!(value);
                    });
                  },
                  padding: padding,
                ),
              ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
  Widget _buildChips(BuildContext context, void Function(void Function()) setState) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: types
            .map((e) => SelectItem(
                  item: e,
                  types: types,
                  setState: setState,
          selectedType:  selectedType ?? types.first,
          onSelected: (bool value) {
            setState(() {
              selectedType = e;
              onSelected!(value);
            });
          },
                  padding: padding,
                ))
            .toList(),
      ),
    );
  }
}

class ChipItem {
  final String title;
  final String? icon;

  ChipItem({required this.title, this.icon});
}

class SelectItem extends StatelessWidget {
  final ChipItem item;
  final List<ChipItem> types;
  final void Function(void Function()) setState;
  final void Function(bool)? onSelected;
  final ChipItem selectedType;
  final EdgeInsetsGeometry? padding;
  const SelectItem({Key? key, required this.item, required this.types, required this.setState, this.onSelected, this.padding, required this.selectedType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: item == types.first
          ? 10.paddingEnd
          : 10.paddingStart,
      child: ChoiceChip(
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item.icon != null && item.icon!.isNotEmpty) ...[
              Image.network(item.icon ?? '',
                  height: 25,
                  width: 25,
                  color: selectedType == item
                      ? context.cardColor
                      : context.primaryColor),
              10.pw,
            ],
            FittedBox(
              child: Text(item.title,
                style: context.textTheme.headlineMedium!
                    .copyWith(
                  color: selectedType == item
                      ? context.cardColor
                      : context.primaryColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        selected: selectedType == item,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        selectedColor: context.primaryColor,
        backgroundColor: context.cardColor,
        side: BorderSide(
          color: selectedType == item
              ? context.secondaryContainer
              : context.outline,
          width: 1,
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
                vertical: 14),
        onSelected: onSelected,
      ),
    );
  }
}

