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
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../cars/data/models/comment_params.dart';
import '../../../domain/entities/plate.dart';
import '../widgets/plate_image_details.dart';
import '../widgets/plate_property.dart';
import '../widgets/plates_details_widget.dart';

class PlatesDetailsScreen extends StatelessWidget {
  final Plate plate;
  final Function()? onToggleFavorite;

  const PlatesDetailsScreen(
      {Key? key, required this.plate, this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: ContactSocialButtons(
        phone: plate.user?.phone ?? '',
        whatsapp: plate.user?.whatsapp ?? '',
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                color: context.gray_f8,
              ),
              Container(
                height: context.height,
                width: double.infinity,
                color: context.cardColor,
              ),
            ],
          ),
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: 0.ph,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(290),
                    child: SingleChildScrollView(
                      padding: 10.paddingAll,
                      child: Column(
                        children: [
                          PlateImageDetails(plate: plate, isDetails: true),
                          Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: FavoriteButton(
                                margin: 10.paddingTop,
                                onToggleFavorite: onToggleFavorite,
                              )),
                          // Text(
                          //   '${plate.letterAr?.toArabicChars() ?? ''}   ${plate.letterEn}',
                          //   style: context.bodyLarge,
                          // ),
                          // 18.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconText(
                                text: plate.address ?? '',
                                icon: AppIcons.location,
                                iconSize: 20,
                                sizedBoxWidth: 4,
                                textColor: context.gray_68,
                              ),
                              PriceWidget(
                                padding: 25.paddingHoriz + 10.paddingVert,
                                price: plate.price ?? '',
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarWidget(
              tabs: [
                TabItemModel(
                  label: context.strings.details,
                  page: PlatesDetailsWidget(
                    plate: plate,
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
                TabItemModel(
                  label: context.strings.comments,
                  page: CommentsPage(
                    params: CommentParams(
                      plateId: plate.id ?? 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
