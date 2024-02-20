import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/buttons/app_icon_button.dart';
import 'package:dalalah/core/widgets/clickable_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/core/widgets/stream/stream_state_widget.dart';
import 'package:dalalah/src/sell_car/domain/entities/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../home/domain/entities/brand.dart';

///  Created by harby on 9/6/2023.
class BrandModelsFilterStream extends StatelessWidget {
  final List<BrandModel>? initialData;
  final StreamStateInitial<List<BrandModel>?> brandModelsStream;
  final Color? backgroundColor;
  final Function(int) onFilter;
  final String? title;

  const BrandModelsFilterStream({
    Key? key,
    this.initialData,
    required this.brandModelsStream,
    required this.onFilter,
    this.backgroundColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = context.strings.all;
    return StreamBuilder<List<BrandModel>?>(
        stream: brandModelsStream.stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? const SizedBox.shrink()
              : BrandModelsFilterList(
                  items: snapshot.data ?? initialData ?? [],
                  backgroundColor: backgroundColor,
                  onFilter: onFilter,
                  title: title,
                );
        });
  }
}

class BrandModelsFilterList extends StatelessWidget {
  final List<BrandModel> items;
  final Color? backgroundColor;
  final Function(int) onFilter;
  final String? title;

  const BrandModelsFilterList({
    Key? key,
    required this.items,
    required this.onFilter,
    this.backgroundColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = context.strings.all;
    return Column(
      crossAxisAlignment:
          title != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (title != null) ...[
          Text(
            title ?? '',
            style: context.bodySmall,
          ),
        ],
        Container(
          margin: 10.paddingHoriz + 10.paddingTop,
          padding: 5.paddingHoriz,
          clipBehavior: Clip.antiAlias,
          decoration: Decorations.kDecorationBorderWithRadius(
            color: backgroundColor ?? context.cardColor,
            // color: Colors.red,
            radius: 50,
            borderColor: const Color(0xffDCDCDC),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StatefulBuilder(builder: (context, setState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: items
                        .map(
                          (e) => Padding(
                            padding: 3.paddingHoriz + 3.paddingTop,
                            child: ChoiceChip(
                              label: Text(
                                e.name ?? '',
                                style: context.bodySmall.copyWith(fontSize: 10),
                              ),
                              selected: item == e.name,
                              backgroundColor: context.scaffoldBackgroundColor,
                              selectedColor: context.scaffoldBackgroundColor,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              showCheckmark: false,
                              side: BorderSide(
                                color: item == e.name
                                    ? context.primaryColor
                                    : context.dividerColor,
                                width: 1,
                              ),
                              onSelected: (bool selected) {
                                if (item == e.name) {
                                  item = context.strings.all;
                                  onFilter(0);
                                } else {
                                  item = e.name;
                                  onFilter(e.id ?? 0);
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              );
            }),
          ),
        ),
      ],
    );
  }
}
