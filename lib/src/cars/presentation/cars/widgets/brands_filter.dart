import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/buttons/app_icon_button.dart';
import 'package:delala/core/widgets/clickable_widget.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/decorations/decorations.dart';

///  Created by harbey on 9/6/2023.
class BrandsFilter extends StatelessWidget {
  final List<String> items;
  final Color? backgroundColor;
  final Function(String) onFilter;

  const BrandsFilter(
      {Key? key,
      required this.items,
      required this.onFilter,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = context.strings.all;
    return Container(
      margin: 10.paddingHoriz,
      padding: 10.paddingHoriz,
      decoration: Decorations.kDecorationBorderWithRadius(
        color: backgroundColor ?? context.cardColor,
        // color: Colors.red,
        radius: 50,
        borderColor: const Color(0xffDCDCDC),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StatefulBuilder(builder: (context, setState) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: items
                      .map(
                        (e) => ClickableWidget(
                          onTap: () {
                            setState(() {
                              onFilter(e);
                            });
                          },
                          child: ChoiceChip(
                            label: const ImageNetworkCircle(
                              image:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPP9unyFq5H4PuKaRmW9bcIYFnvkHeVemueQ&usqp=CAU",
                              fit: BoxFit.cover,
                              size: 25,
                            ),
                            selected: item == e,
                            backgroundColor: context.scaffoldBackgroundColor,
                            selectedColor: context.scaffoldBackgroundColor,
                            shape: const CircleBorder(),
                            side: BorderSide(
                              color: item == e
                                  ? context.primaryColor
                                  : context.dividerColor,
                              width: 1,
                            ),
                            onSelected: (bool selected) {
                              setState(() {
                                item = selected ? e : null;
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 0),
          //   child: ChoiceChip(
          //     label: Text(
          //       context.strings.all,
          //       style: context.bodySmall.copyWith(fontSize: 18),
          //     ),
          //     // padding: const EdgeInsets.all(16),
          //     selected: item == items.first,
          //     backgroundColor: context.scaffoldBackgroundColor,
          //     selectedColor: context.scaffoldBackgroundColor,
          //     shape: const CircleBorder(),
          //     side: BorderSide(
          //       color: item == context.strings.all
          //           ? context.primaryColor
          //           : context.dividerColor,
          //       width: 1.3,
          //     ),
          //     onSelected: (bool selected) {
          //       // setState(
          //       //       () {
          //       //     item = context.strings.all;
          //       //   },
          //       // );
          //     },
          //   ),
          // ),
          AppIconButton(
            icon: AppIcons.left_arrow,
            color: AppColors.grey_95,
          )
        ],
      ),
    );
  }
}
