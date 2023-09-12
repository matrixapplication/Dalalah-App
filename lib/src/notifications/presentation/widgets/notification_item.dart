import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:arabitac/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';

import '../../../../core/decorations/decorations.dart';
import '../../../../core/widgets/scaffold/custom_divider.dart';
import '../../domain/entities/notification.dart';

class NotificationItem extends StatelessWidget {
  final Notifications notification;
  final bool isFirst;
  final bool isLast;

  const NotificationItem(
      {Key? key, required this.isFirst, required this.isLast, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 8),
      decoration: Decorations.kDecorationBorderRadius(color: context.cardColor, borderColor: context.colorScheme.onSecondary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetwork(
            image: notification.image ?? '',
            size: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ListTile(
              dense: true,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      notification.title ?? '',
                      style: context.bodyLarge.copyWith(fontSize: 16),
                    ),
                  ),
                  Text(
                    notification.date ?? '',
                    style: context.displaySmall.copyWith(color: context.displaySmall.color?.withOpacity(0.5), fontSize: 12),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  notification.description ?? '',
                  style: context.displaySmall.copyWith(fontSize: 12),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
