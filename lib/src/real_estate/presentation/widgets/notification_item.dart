import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/widgets/scaffold/custom_divider.dart';
import '../../../main_index.dart';
import '../../domain/entities/notification.dart';

class NotificationItem extends StatelessWidget {
  final Notifications notification;
  final bool isFirst;
  final bool isLast;

  const NotificationItem(
      {Key? key,
      required this.isFirst,
      required this.isLast,
      required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: 16.paddingHoriz + 12.paddingVert,
      decoration: Decorations.kDecorationBorderWithRadius(
          color: context.cardColor,
          borderColor: context.colorScheme.onSecondary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSquareCompanyLogo(
            logoPath: AppImages.car_name,
            width: 60,
            height: 60,
          ),
          20.pw,
          Expanded(
            child: ListTile(
              dense: true,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                // notification.title ?? '',
                "قسط عربيتك الجديدة مع الحمد للسيارات",
                style: context.bodySmall.copyWith(
                  // fontSize: 15
                ),
              ),
              subtitle: Padding(
                padding: 7.paddingTop,
                child: Text(
                  // notification.description ?? '',
                  "أقل فايده, اطول فترة سداد",
                  style: context.displaySmall.copyWith(
                    // fontSize: 13
                    fontSize: 12
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
