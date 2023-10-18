import 'package:delala/core/widgets/icons/icon_text.dart';

import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/buttons/call_button.dart';
import '../../../../../core/widgets/buttons/chat_whats_app_button.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../main_index.dart';
import '../../exhibitions/widgets/custom_exhibition_circle_logo.dart';
import 'views/branches_view.dart';
import 'views/new_cars_view.dart';
import 'views/used_cars_view.dart';

class ExhibitionDetailsScreen extends BaseStatelessWidget {
  ExhibitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
          bottom: PreferredSize(
            preferredSize: const Size(0, 265),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SlidersCarDetails(
                      images: const ['', '', '', ''],
                    ),
                    PositionedDirectional(
                      top: 12,
                      end: 12,
                      child: CustomExhibitionCircleLogo(
                        logoPath: AppImages.car_name,
                        name: 'الجمد للسيارت',
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 15,
                      child: Row(
                        children: [
                          ChatWhatsAppButton(phone: '01065950766'),
                          10.pw,
                          const CallButton(phone: '01065950766'),
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
                      Text(
                        "الجمد للسيارت",
                        style: context.textTheme.labelLarge!.copyWith(
                          color: AppColors.grey_41,
                        ),
                      ),
                      15.ph,
                      IconText(
                        text: "جدة",
                        textStyle: context.textTheme.displayLarge!.copyWith(
                          color: AppColors.grey_68,
                        ),
                        icon: AppIcons.yellow_location,
                        // iconColor: Colors.yellow,
                        iconSize: 28,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),
                ),
                20.ph,
              ],
            ),
          ),
        ),
      ],
      body: Expanded(
        child: TabBarWidget(
          tabs: [
            TabItemModel(
              label: context.strings.new_,
              page: NewCarsView(),
            ),
            TabItemModel(
              label: context.strings.used,
              page: UsedCarsView(),
            ),
            TabItemModel(
              label: context.strings.branches,
              page: BranchesView(),
            ),
          ],
        ),
      ),
    );
  }
}
