import 'package:delala/core/assets/app_images.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/chip/price_widget.dart';
import 'package:delala/core/widgets/icons/icon_text.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:delala/core/widgets/scaffold/app_scaffold.dart';
import 'package:delala/src/favorites_and_ads/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/buttons/contact_social_buttons.dart';
import '../../../domain/entities/plate.dart';
import '../widgets/plate_property.dart';

class PlatesDetailsScreen extends StatelessWidget {
  final List<Plate> plates;

  const PlatesDetailsScreen({Key? key, required this.plates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: const ContactSocialButtons(
        phone: '+201141475581',
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: context.height * 0.3,
                  width: double.infinity,
                  color: context.gray_f8,
                ),
                Container(
                  height: context.height * 0.55,
                  width: double.infinity,
                  color: context.cardColor,
                ),
              ],
            ),
            Padding(
              padding: 16.paddingAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageNetwork(
                    margin: 16.paddingAll,
                    image: plates[0].image,
                    height: context.height * 0.201,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: FavoriteButton(
                        margin: 10.paddingTop,
                      )),
                  Text(
                    'ب  ط  ل     8888',
                    style: context.bodyLarge,
                  ),
                  18.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        text: 'جده',
                        icon: AppIcons.location,
                        iconSize: 20,
                        sizedBoxWidth: 4,
                        textColor: context.gray_68,
                      ),
                      PriceWidget(
                          padding: 25.paddingHoriz + 10.paddingVert,
                          price: '800,000'),
                    ],
                  ),
                  20.ph,
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
                    text: 'Mohamed Ali',
                    icon: AppImages.car_name,
                    iconSize: 50,
                  ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PlatesDetailsProperty(
                          label: context.strings.plate_type,
                          value: 'خصوصي',
                        ),
                      ),
                      14.pw,
                      Expanded(
                        child: PlatesDetailsProperty(
                          label: context.strings.city,
                          value: 'جدة',
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  PlatesDetailsProperty(
                    label: context.strings.announcement_date,
                    value: '25-09-2023',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
