import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/expansionTile/custom_expansion_tile.dart';
import 'border_widget.dart';

///  Created by harbey on 9/6/2023.
class CarDetails extends StatelessWidget {
  CarDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BorderWidget(
      title:   context.strings.car_details,
      child: Column(
        children: [
          CustomExpansionTile(
            title: context.strings.specifications,
            children: [
              CarDetailsItem(),
            ],
          ),
          Divider(
            color: context.outline,
            thickness: 0.8,
            height: 1,
          ),
          CustomExpansionTile(
            title: context.strings.safety,
            children: [
              CarDetailsItem(),
            ],
          ),
          Divider(
            color: context.outline,
            thickness: 0.8,
            height: 1,
          ),
          CustomExpansionTile(
            title: context.strings.technologies,
            children: [
              CarDetailsItem(),
            ],
          ),
          100.ph,
        ],
      ),
    );
  }
}


class CarDetailsItem extends StatelessWidget {
  const CarDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '• Sedan',
          style: context.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            shoReport(context);
          },
          child: Text(
            context.strings.show_report,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.surface,
            ),
          ),
        ),
      ],
    );
  }

  shoReport(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          title: Align(
              alignment: AlignmentDirectional.topStart,
              child: CloseButton(color: context.primaryColorDark,)),
          content: ImageNetwork(
            image: 'https://media.istockphoto.com/id/157418863/photo/close-up-of-the-eye-on-peacock-feathers.jpg?s=612x612&w=0&k=20&c=GwhA53Dikym8Rw2NWOYavsoIdrRWBNPPSJ1Sua-JSqM=',
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
