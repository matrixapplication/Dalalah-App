import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/buttons/icon_text_button.dart';
import 'package:dalalah/core/widgets/icons/icon_text.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import 'package:dalalah/src/showrooms/presentation/showroom_details/pages/showroom_cars_page.dart';
import 'package:dalalah/src/showrooms/presentation/showroom_details/pages/showroom_plates_page.dart';

import '../../../../../core/widgets/buttons/call_button.dart';
import '../../../../../core/widgets/buttons/chat_whats_app_button.dart';
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../domain/entities/showroom.dart';
import '../../branches/pages/branches_page.dart';
import '../../showrooms/widgets/custom_exhibition_circle_logo.dart';

class ExhibitionDetailsScreen extends BaseStatelessWidget {
  final Showroom showroom;
  final bool isAgency;
  final Function()? onAddRate;
  final Function()? onFollow;

  ExhibitionDetailsScreen(
      {super.key,
      required this.showroom,
      this.isAgency = false,
      this.onAddRate,
      this.onFollow});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
          bottom: PreferredSize(
            preferredSize: const Size(0, 280),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SlidersCarDetails(
                      images: [showroom.image ?? ''],
                    ),
                    PrimaryButton(
                      height: 40,
                      width: 20,
                      radius: 50,
                      margin: 10.paddingTop + 10.paddingStart,
                      title: showroom.isFollowed ?? false
                          ? context.strings.follower
                          : context.strings.follow,
                      onPressed: () {
                        onFollow?.call();
                      },
                    ),
                    PositionedDirectional(
                      top: 12,
                      end: 12,
                      child: CustomExhibitionCircleLogo(
                        logoPath: AppImages.splash_logo,
                        name: showroom.showroomName ?? '',
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 15,
                      child: Row(
                        children: [
                          ChatWhatsAppButton(phone: showroom.whatsapp ?? ''),
                          10.pw,
                          CallButton(phone: showroom.phone ?? ''),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: 15.paddingHoriz,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.ph,
                      RowTexts(
                        title: showroom.showroomName ?? '',
                        value: '${showroom.followers ?? 0} ${context.strings.followers}',
                        titleStyle:  context.bodyLarge,
                        valueStyle: context.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconText(
                            text: showroom.address ?? '',
                            textStyle: context.textTheme.displayLarge!.copyWith(
                              color: AppColors.grey_68,
                            ),
                            icon: AppIcons.yellow_location,
                            // iconColor: Colors.yellow,
                            iconSize: 22,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          IconTextButton(
                            icon: AppIcons.star,
                            iconSize: 20,
                            text: showroom.avgRate?.toString() ?? '',
                            textStyle: context.bodyMedium.copyWith(
                              color: context.yellow_00,
                            ),
                            onTap: () async {
                              onAddRate?.call();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      body: TabBarWidget(
        tabs: [
          TabItemModel(
            label: context.strings.new_,
            page: ShowroomCarsPage(id: showroom.id ?? 0),
          ),
          if (!(showroom.isAgency ?? false))
            TabItemModel(
              label: context.strings.used,
              page: ShowroomCarsPage(
                  status: CarStatus.usedCar, id: showroom.id ?? 0, ),
            ),
          TabItemModel(
            label: context.strings.plates,
            page: ShowroomPlatesPage(id: showroom.id ?? 0),
          ),
          TabItemModel(
            label: context.strings.branches,
            page: BranchesPage(showroomId: showroom.id),
          ),
        ],
      ),
    );
  }
}
