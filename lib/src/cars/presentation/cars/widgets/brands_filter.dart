import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/buttons/app_icon_button.dart';
import 'package:dalalah/core/widgets/clickable_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/core/widgets/stream/stream_state_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../home/domain/entities/brand.dart';

///  Created by harbey on 9/6/2023.
class BrandsFilter extends StatelessWidget {
  final StreamStateInitial<List<Brand>> brandsStream;
  final Color? backgroundColor;
  final Function(int) onFilter;

  const BrandsFilter(
      {Key? key,
      required this.brandsStream,
      required this.onFilter,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = context.strings.all;
    return StreamStateWidget<List<Brand>>(
      stream: brandsStream,
      builder: (context, snapshot) {
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
                      children: snapshot.map(
                            (e) => ChoiceChip(
                              label: ImageNetworkCircle(
                                image: e.image,
                                fit: BoxFit.cover,
                                size: 25,
                                iconErrorSize: 20,
                              ),
                              selected: item == e.name,
                              backgroundColor: context.scaffoldBackgroundColor,
                              selectedColor: context.scaffoldBackgroundColor,
                              shape: const CircleBorder(),
                              side: BorderSide(
                                color: item == e.name
                                    ? context.primaryColor
                                    : context.dividerColor,
                                width: 1,
                              ),
                              onSelected: (bool selected) {
                                if(item == e.name){
                                  item = context.strings.all;
                                  onFilter(0);
                                } else {
                                  item = e.name;
                                  onFilter(e.id ?? 0);
                                }
                                setState(() {});
                              },
                            ),
                          )
                          .toList() ??
                          [],
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
    );
  }
}
