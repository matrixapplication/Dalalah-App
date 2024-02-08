import 'package:dalalah/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';

import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../data/models/notification_dto.dart';

class NotificationItem extends StatelessWidget {
  final NotificationDto notification;

  const NotificationItem(
      {Key? key,
      required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNamed(Routes.carDetailsPage, arguments: notification.carId);
      },
      child: Container(
        alignment: Alignment.center,
        padding: 16.paddingHoriz + 12.paddingVert,
        decoration: Decorations.kDecorationBorderWithRadius(
            color: context.cardColor,
            borderColor: context.colorScheme.onSecondary),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSquareCompanyLogo(
              logoPath: AppImages.splash_logo,
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
                    notification.message ?? '',
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
      ),
    );
  }
}
