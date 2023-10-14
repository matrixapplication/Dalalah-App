import 'package:delala/core/widgets/icons/icon_text.dart';

import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../main_index.dart';
import '../../exhibitions/widgets/custom_exhibition_circle_logo.dart';
import 'views/new_cars_view.dart';
import 'views/used_cars_view.dart';

class ExhibitionDetailsScreen extends BaseStatelessWidget {
  ExhibitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SlidersCarDetails(
              images: ['', '', '', ''],
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
                  AppCircularIconButton(
                    padding: 8,
                    size: 30,
                    circleSize: 45,
                    icon: AppIcons.whatsapp_2,
                    backgroundColor: context.cardColor,
                    shadowColor: context.cardColor.withOpacity(0.2),
                    margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                    onPressed: () {},
                  ),
                  10.pw,
                  AppCircularIconButton(
                    icon: AppIcons.phone_solid,
                    color: AppColors.blue_31,
                    backgroundColor: context.cardColor,
                    circleSize: 45,
                    shadowColor: context.cardColor.withOpacity(0.2),
                    padding: 12,
                    size: 22,
                    margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                  ),
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
                iconSize: 28,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
        20.ph,
        Expanded(
          child: TabBarWidget(
            labelSize: 14,
            tabs: [
              TabItemModel(
                label: context.strings.new_cars,
                page: NewCarsView(),
              ),
              TabItemModel(
                label: context.strings.used_cars,
                page: UsedCarsView(),
              ),
              TabItemModel(
                label: context.strings.branches,
                page: 0.ph,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
