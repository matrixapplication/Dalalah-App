import 'package:delala/src/home/presentation/widgets/sub_custom_container.dart';
import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../widgets/car_details.dart';
import '../widgets/price_car_details.dart';
import '../widgets/sliders_car_details.dart';
import 'views/car_details_category_view.dart';
import 'views/car_details_details_view.dart';
import 'views/car_details_price_view.dart';

class CarsDetailsScreen extends BaseStatelessWidget {
  final List<Task> tasks;

  CarsDetailsScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: Expanded(
        child: TabBarWidget(
          tabs: [
            TabItemModel(
              label: context.strings.price,
              page: CarDetailsPriceView(),
            ),
            TabItemModel(
              label: context.strings.details,
              page: CarDetailsDetailsView(),
            ),
            TabItemModel(
              label: context.strings.categories,
              page: CarDetailsCategoryView(),
            ),
          ],
        ),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
          forceElevated: innerBoxIsScrolled,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size(0,305),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SlidersCarDetails(
                      images: const ['', '', '', ''],
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 10,
                      child: AppCircularIconButton(
                        icon: AppIcons.heart,
                        circleSize: 45,
                        backgroundColor: context.cardColor,
                        color: context.primaryColor,
                        shadowColor: context.cardColor.withOpacity(0.2),
                        padding: 12,
                        size: 22,
                        margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: 15.paddingHoriz,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'بي ام دبليو  X6 218i X6 218i',
                        style: context.textTheme.titleSmall!.copyWith(
                          color: AppColors.grey_2C,
                        ),
                      ),
                      15.ph,
                      Row(
                        children: [
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: context.strings.new_,
                            fontSize: 14,
                            labelColor: AppColors.blue_31,
                            width: 55,
                          ),
                          14.pw,
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: '2023',
                            fontSize: 14,
                            labelColor: AppColors.blue_31,
                            width: 58,
                          ),
                        ],
                      ),
                      10.ph,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomChip(
                          backgroundColor: context.primaryColor,
                          label: '800,000 ${context.strings.rs}',
                          fontSize: 18,
                          padding: 5.paddingVert,
                          width: 170,
                        ),
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
    );
  }
}

// CarProperties(
//   properties: [
//     CarProperty(
//       title: 'Sedan',
//       subtitle: context.strings.body_shape,
//       icon: AppIcons.sedan_car_model,
//     ),
//     CarProperty(
//       title: 'Gas',
//       subtitle: context.strings.fuel_type,
//       icon: AppIcons.gas_station,
//     ),
//     CarProperty(
//       title: 'Automatic',
//       subtitle: context.strings.transmission,
//       icon: AppIcons.transmission,
//     ),
//     CarProperty(
//       title: '25,000 KM',
//       subtitle: context.strings.kilometers,
//       icon: AppIcons.sedan_car_model,
//     ),
//     CarProperty(
//       title: '1600 CC',
//       subtitle: context.strings.engine_capacity,
//       icon: AppIcons.sedan_car_model,
//     ),
//   ],
// ),
