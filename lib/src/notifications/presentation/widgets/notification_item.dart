import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:delala/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';
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
      padding: 20.paddingHoriz + 20.paddingVert,
      decoration: Decorations.kDecorationBorderWithRadius(
          color: context.cardColor,
          borderColor: context.colorScheme.onSecondary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSquareCompanyLogo(
            logoPath: AppImages.car_name,
            width: 70,
            height: 70,
          ),
          30.pw,
          Expanded(
            child: ListTile(
              dense: true,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                // notification.title ?? '',
                "قسط عربيتك الجديدة مع الحمد للسيارات",
                style: context.bodyMedium.copyWith(
                  fontSize: 15
                ),
              ),
              subtitle: Padding(
                padding: 6.paddingTop,
                child: Text(
                  // notification.description ?? '',
                  "أقل فايده, اطول فترة سداد",
                  style: context.displayMedium.copyWith(
                    fontSize: 13
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
