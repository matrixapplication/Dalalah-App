import 'package:dalalah/core/utils/navigator.dart';

import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../home/presentation/widgets/cars_home_list.dart';
import '../../../../home/presentation/widgets/sub_custom_container.dart';
import '../../../../main_index.dart';

class CarVerticalItem extends StatelessWidget {
  final int? index;
  final bool isCatItem;
  final double? bottomMargin;
  final String? carStatus;
  final bool imageHasOnlyTopRadius;
  final bool isFavouriteView;
  final bool isAddView;
  final bool isNew;

  // final Task task;
  const CarVerticalItem({
    Key? key,
    this.isCatItem = false,
    this.bottomMargin,
    this.imageHasOnlyTopRadius = true,
    this.carStatus,
    this.isFavouriteView = false, //used for checking fav icon style
    this.isAddView = false, //used for checking on tap action
    this.index,
    this.isNew = true,
    // required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigators.pushNamed(
        isAddView ? Routes.sellCarPage : Routes.carDetailsPage,
        arguments: isNew,
      ),
      child: Container(
        height: 160,
        margin: (bottomMargin ?? 14).paddingBottom,
        decoration: bottomMargin == 0
            ? Decorations.kDecorationTopRadius(
                color: AppColors.grey_fa,
              )
            :
        Decorations.kDecorationBorderRadius(
          borderRadius: BorderRadiusDirectional.circular(5),
          color: AppColors.grey_fa,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: 8.paddingHoriz + 5.paddingBottom,
                // width: 220,
                decoration: bottomMargin == 0
                    ? Decorations.kDecorationTopRadius(
                  color: AppColors.grey_fa,
                )
                    : Decorations.kDecorationBoxShadow(
                        borderRadius: const BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(5),
                          topStart: Radius.circular(5),
                        ),
                        color: AppColors.grey_fa,
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    4.ph,
                    Text(
                      isCatItem? "بي ام دبليو  X6 218i X6 218i Sport Line" : "بي ام دبليو  X6 218i X6 218i ADVANTAGE ",
                      style: context.textTheme.labelLarge!.copyWith(
                        color: AppColors.grey_2C,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Spacer(),
                    Row(
                      children: [
                        CustomChip(
                          backgroundColor: AppColors.grey_d9,
                          label: carStatus ?? context.strings.new_,
                          fontSize: 14,
                          labelColor: AppColors.blue_31,
                          padding: 3.paddingVert + 10.paddingHoriz,
                        ),
                        14.pw,
                        CustomChip(
                          backgroundColor: AppColors.grey_d9,
                          label: '2023',
                          fontSize: 14,
                          labelColor: AppColors.blue_31,
                          padding: 3.paddingVert + 10.paddingHoriz,
                        ),
                      ],
                    ),
                    10.ph,
                    CustomChip(
                      radius: 15,
                      backgroundColor: context.primaryColor,
                      label: '800,000 ${context.strings.rs}',
                      fontSize: 16,
                      padding: 4.paddingVert,
                      width: 145,
                      // padding: 3.paddingVert + 5.paddingHoriz,
                    ),
                    10.ph,
                    FittedBox(
                      child: Row(
                        children: [
                          CarDetailsContainer(
                            label: '2000',
                            icon: AppIcons.fuel,
                          ),
                          5.pw,
                          CarDetailsContainer(
                            label: '5,7',
                            icon: AppIcons.timer,
                          ),
                          5.pw,
                          CarDetailsContainer(
                            label: '4',
                            icon: AppIcons.chair,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ImageNetwork(
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
                    height: double.infinity,
                    borderRadius: imageHasOnlyTopRadius
                        ? const BorderRadiusDirectional.only(
                            topStart: Radius.circular(5),
                            topEnd: Radius.circular(5),
                          )
                        : BorderRadiusDirectional.circular(5),
                  ),
                  if(index == 0)
                  PositionedDirectional(
                    top: 7,
                    start: 6,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F8D8D8D),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Image.asset(AppImages.primary_car),
                    ),
                  ),
                  PositionedDirectional(
                    top: 2,
                    end: 2,
                    child: AppCircularIconButton(
                      icon: isAddView
                          ? AppIcons.edit
                          : isFavouriteView
                          ? AppIcons.heart_solid
                          : AppIcons.heart,
                      color: AppColors.blue_F7,
                      backgroundColor: context.cardColor,
                      shadowColor: context.cardColor.withOpacity(0.2),
                      padding: 7,
                      size: 13,
                      margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                    ),
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
