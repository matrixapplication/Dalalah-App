import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/icons/icon_text.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/core/widgets/scaffold/app_scaffold.dart';
import 'package:dalalah/src/cars/presentation/comments/pages/comments_page.dart';
import 'package:dalalah/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:dalalah/src/plates/presentation/plates/widgets/plate_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/buttons/contact_social_buttons.dart';
import '../../../../cars/data/models/comment_params.dart';
import '../../../domain/entities/plate.dart';
import '../widgets/plate_property.dart';

class PlatesDetailsWidget extends StatelessWidget {
  final Plate plate;
  final Function()? onToggleFavorite;

  const PlatesDetailsWidget({Key? key, required this.plate, this.onToggleFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: 16.paddingStart,
            margin: 20.paddingBottom,
            decoration: Decorations.kDecorationBorderWithRadius(
                color: context.scaffoldBackgroundColor,
                borderColor: context.gray_5c,
                radius: 50
            ),
            child: IconText(
              mainAxisAlignment: MainAxisAlignment.start,
              text: plate.user?.name ?? '',
              icon: plate.user?.image ?? '',
              iconSize: 50,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: PlatesDetailsProperty(
                  label: context.strings.plate_type,
                  value: plate.plateType == 'private'
                      ? 'خصوصي'
                      : 'نقل',
                ),
              ),
              14.pw,
              Expanded(
                child: PlatesDetailsProperty(
                  label: context.strings.city,
                  value: plate.city?.name ?? '',
                ),
              ),
            ],
          ),
          20.ph,
          PlatesDetailsProperty(
            label: context.strings.announcement_date,
            value:  plate.createdAt ?? '',
          ),
        ],
      ),
    );
  }
}
