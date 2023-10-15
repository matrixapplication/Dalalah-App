import 'package:delala/core/utils/helper_methods.dart';

import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/buttons/primary_icon_button.dart';
import '../../../../../core/widgets/chip/chip_border.dart';
import '../../../../../core/widgets/chip/price_widget.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../../core/widgets/list-tile/custom_list_tile2.dart';
import '../../../../home/presentation/widgets/cars_list.dart';
import '../../../../home/presentation/widgets/sub_custom_container.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';

class CarVerticalItem extends StatelessWidget {
  final bool isCatItem;
  final double? bottomMargin;
  final String? carStatus;
  final bool imageHasOnlyTopRadius;

  // final Task task;
  const CarVerticalItem({
    Key? key,
    this.isCatItem = false,
    this.bottomMargin,
    this.imageHasOnlyTopRadius = true,
    this.carStatus,
    // required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isCatItem ? 140 : 148,
          margin: EdgeInsetsDirectional.only(
              bottom: isCatItem ? 0 : bottomMargin ?? 20),
          decoration: Decorations.kDecorationBorderRadius(
            borderRadius: isCatItem
                ? const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(5),
                    topStart: Radius.circular(5),
                  )
                : BorderRadiusDirectional.circular(5),
            color: AppColors.grey_fa,
          ),
          child: Row(
            children: [
              (isCatItem ? 8 : 0).pw,
              Expanded(
                flex: 3,
                child: Container(
                  padding: (isCatItem ? 0 : 8).paddingStart,
                  margin: (isCatItem ? 0 : 5).paddingStart,
                  // width: 220,
                  decoration: isCatItem
                      ? null
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
                      6.ph,
                      Flexible(
                        child: Text(
                          "بي ام دبليو  X6 218i X6 218i ADVANTAGE ",
                          style: context.textTheme.labelLarge!.copyWith(
                            color: AppColors.grey_2C,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      8.ph,
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
                      15.ph,
                      CustomChip(
                        radius: 15,
                        backgroundColor: AppColors.blue_49,
                        label: '800,000 ${context.strings.rs}',
                        fontSize: 16,
                        padding: 4.paddingVert,
                        width: 145,
                        // padding: 3.paddingVert + 5.paddingHoriz,
                      ),
                      15.ph,
                      Row(
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
                      )
                    ],
                  ),
                ),
              ),
              // 5.pw,
              // Stack(
              //   children: [
              //     ClipRRect(
              //       borderRadius: isCatItem
              //           ? const BorderRadiusDirectional.only(
              //               topStart: Radius.circular(5),
              //               topEnd: Radius.circular(5),
              //             )
              //           : BorderRadiusDirectional.circular(5),
              //       child: Image.asset(
              //         AppImages.beuti_car,
              //         // height: double.infinity,
              //         // width: double.infinity,
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //     // PositionedDirectional(
              //     //   top: 7,
              //     //   end: 6,
              //     //   child: AppCircularIconButton(
              //     //     icon: AppIcons.heart,
              //     //     color: AppColors.blue_F7,
              //     //     backgroundColor: context.cardColor,
              //     //     shadowColor: context.cardColor.withOpacity(0.2),
              //     //     padding: 7,
              //     //     size: 13,
              //     //     margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
              //     //   ),
              //     // ),
              //   ],
              // )
              Expanded(
                flex: 2,
                child: ImageNetwork(
                  image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
                  height: double.infinity,
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 7,
          end: 6,
          child: AppCircularIconButton(
            icon: AppIcons.heart,
            color: AppColors.blue_F7,
            backgroundColor: context.cardColor,
            shadowColor: context.cardColor.withOpacity(0.2),
            padding: 7,
            size: 13,
            margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
          ),
        ),
      ],
    );
  }
}
