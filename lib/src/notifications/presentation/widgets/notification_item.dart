import 'package:dalalah/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';

import '../../../main_index.dart';
import '../../../real_estate/domain/entities/notification.dart';

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
                notification.title ?? '',
                style: context.bodySmall.copyWith(
                  // fontSize: 15
                ),
              ),
              subtitle: Padding(
                padding: 7.paddingTop,
                child: Text(
                  notification.description ?? '',
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
