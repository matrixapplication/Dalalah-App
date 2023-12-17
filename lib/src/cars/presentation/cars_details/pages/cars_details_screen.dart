import 'package:dalalah/core/widgets/icons/icon_text.dart';
import 'package:dalalah/src/cars/presentation/cars/widgets/cars_list.dart';
import 'package:dalalah/src/home/presentation/widgets/sub_custom_container.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../main_index.dart';
import '../../../data/models/model_object.dart';
import '../../../domain/entities/car_details.dart';
import '../widgets/car_details_ratings.dart';
import '../widgets/sliders_car_details.dart';
import '../widgets/user_info.dart';
import 'views/car_details_details_view.dart';
import 'views/car_details_price_view.dart';

class CarsDetailsScreen extends BaseStatelessWidget {
  final bool isNew;
  final CarDetails carDetails;
  final Function()? onToggleFavorite;

  CarsDetailsScreen({Key? key, required this.carDetails, required this.isNew,  required this.onToggleFavorite,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNew = carDetails.status?.name == 'new';
    return NestedScrollView(
      body: TabBarWidget(
        tabs: [
          TabItemModel(
            label: strings.details,
            page: CarDetailsDetailsView(
              features: carDetails.features ?? [],
            ),
          ),
          if(isNew)
          TabItemModel(
            label: strings.price,
            page: CarDetailsPriceView(
              carDetails: carDetails,
            ),
          ),
          if(isNew)
          TabItemModel(
            label: strings.categories,
            page: CarsList(cars: ['', '', '', ''], isCatItem: true),
          ),
       //   if(isNew)
          TabItemModel(
            label: strings.ratings,
            page: CarDetailsRatings(),
          ),
        ],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
          forceElevated: innerBoxIsScrolled,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize:  Size(0,isNew ? 316 : 400),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SlidersCarDetails(
                      images: carDetails.allImages(),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 10,
                      child: FavoriteButton(
                        isFavorite: carDetails.isFavorite ?? false,
                        onToggleFavorite: () {
                          onToggleFavorite?.call();
                        },

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
                        "${carDetails.brandModel?.brand} ${carDetails.brandModel?.name}",
                        style: context.textTheme.titleSmall!.copyWith(
                          color: AppColors.grey_2C,
                        ),
                      ),
                      15.ph,
                      Row(
                        children: [
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: carDetails.status?.name ?? '',
                            fontSize: 14,
                            labelColor: AppColors.blue_31,
                            width: 55,
                          ),
                          14.pw,
                          CustomChip(
                            backgroundColor: AppColors.grey_d9,
                            label: carDetails.year ?? '',
                            fontSize: 14,
                            labelColor: AppColors.blue_31,
                            width: 58,
                          ),
                        ],
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(isNew)
                          IconText(
                            icon: AppIcons.star,
                            text: '4.8',
                            textStyle: context.bodyMedium.copyWith(
                              color: context.yellow_00,
                            ),
                          ),
                          Spacer(),
                          CustomChip(
                            backgroundColor: context.primaryColor,
                            label: '${carDetails.price ?? ''} ${context.strings.rs}',
                            fontSize: 18,
                            padding: 5.paddingVert,
                            width: 170,
                          ),
                        ],
                      ),

                      if(!isNew)
                        UserInfo(
                          user: carDetails.modelObject ?? ModelObject(),
                        ),
                    ],
                  ),
                ),
                19.ph,
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
