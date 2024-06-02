import 'package:dalalah/core/widgets/chip/price_widget.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../favorites_and_ads/presentation/widgets/favorite_button.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../data/models/comment_params.dart';
import '../../../data/models/model_object.dart';
import '../../../domain/entities/car_details.dart';
import '../../comments/pages/comments_page.dart';
import '../widgets/car_details_property_item.dart';
import '../widgets/car_properties.dart';
import '../widgets/dates_create_widget.dart';
import '../widgets/sliders_car_details.dart';
import '../widgets/user_info.dart';
import 'views/car_details_details_view.dart';

class CarsDetailsScreen extends BaseStatelessWidget {
  final bool isNew;
  final CarDetails carDetails;
  final Function()? onToggleFavorite;
  final Function(int)? onRequestPrice;

  CarsDetailsScreen({
    Key? key,
    required this.carDetails,
    required this.isNew,
    required this.onToggleFavorite,
    this.onRequestPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNew = carDetails.car?.status?.key == CarStatus.newCar;
    Car car = carDetails.car ?? Car();
    return NestedScrollView(
      body: TabBarWidget(
        //backgroundColor: context.cardColor,
        tabs: [
          TabItemModel(
            label: strings.details,
            page: CarDetailsDetailsView(
              carDetails: carDetails,
              onToggleFavorite: onToggleFavorite,
            ),
          ),
          // if (isNew)
          //   TabItemModel(
          //     label: strings.price,
          //     page: CarDetailsPriceView(
          //       carDetails: carDetails,
          //       onRequestPrice: onRequestPrice,
          //     ),
          //   ),
          // if (isNew)
          //   TabItemModel(
          //     label: strings.categories,
          //     page: CarsPage(
          //       isDetailsPage: true,
          //       params: CarFilterParams(
          //         startYear: int.parse(car.year ?? '0'),
          //         brand: car.brand?.id ?? 0,
          //         carModel: car.brandModel?.id ?? 0,
          //       ),
          //     ),
          //   ),
          //   if(isNew)
          TabItemModel(
            label: strings.comments,
            page: CommentsPage(
              params: CommentParams(
                carId: car.id ?? 0,
              ),
            ),
          ),
        ],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
          forceElevated: innerBoxIsScrolled,
          backgroundColor: Colors.white,
          leading: 0.ph,
          expandedHeight: car.isShowInstallment() ? 920 : 820,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SlidersCarDetails(
                      images: car.allImages(),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 10,
                      child: FavoriteButton(
                        isFavorite: car.isFavorite ?? false,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              car.fullName(),
                              style: context.textTheme.titleSmall!.copyWith(
                                color: AppColors.grey_2C,
                              ),
                            ),
                          ),
                          PriceWidget(
                            price: car.price ?? '0.0',
                            fontSize: 18,
                          ),
                        ],
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppIcon(
                            icon: AppIcons.yellow_location,
                            size: 25,
                          ),
                          Expanded(
                            child: Text(
                              car.city?.name ?? '',
                              style: bodyMedium,
                            ),
                          ),
                        ],
                      ),
                     if (car.isShowInstallment())
                      Container(
                        padding: 10.paddingAll,
                        margin: 10.paddingTop,
                        decoration: Decorations.kDecorationBorderRadius(
                          colorBorder: context.dividerColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowTexts(
                              title: strings.monthly_installment,
                              value: '${car.monthlyInstallment ?? ''} ${context.strings.rs}',
                              titleStyle: context.bodyMedium,
                              valueStyle: context.headlineMedium,
                            ),
                            10.ph,
                            Text(
                              '${strings.notice}:',
                              style: context.bodySmall,
                            ),
                            5.ph,
                            Text(
                              strings.installment_notice_desc,
                              style: context.displaySmall,
                            ),
                          ],
                        ),
                      ),
                      DatesCreateWidget(
                        createdDate: car.createdAt ?? '',
                        updatedDate: car.updatedAt ?? '',
                      ),
                      15.ph,
                      // Wrap(
                      //   crossAxisAlignment: WrapCrossAlignment.center,
                      //    alignment: WrapAlignment.center,
                      //    runSpacing: 8,
                      //    spacing: 8,
                      //    children: carDetails.properties(context)?.map((property) {
                      //      return CarDetailsPropertyItem(
                      //        property: property,
                      //      );
                      //    }).toList() ?? [],
                      // ),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: carDetails.properties(context).length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: context.width / 250,
                        ),
                        itemBuilder: (context, index) {
                          CarProperty property =
                              carDetails.properties(context)[index];
                          return CarDetailsPropertyItem(
                            property: property,
                          );
                          // return Container(
                          //   padding: 5.paddingHoriz,
                          //   decoration: Decorations.kDecorationBorderRadius(
                          //     colorBorder: context.dividerColor,
                          //   ),
                          //   child: ColumnTexts(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     title: property.subtitle ?? '',
                          //     value: property.title,
                          //     titleStyle: context.bodySmall.copyWith(
                          //       fontSize: 12,
                          //     ),
                          //     valueStyle: context.headlineSmall.copyWith(
                          //       fontSize: 12,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      16.ph,
                      UserInfo(
                        user: car.modelObject ?? ModelObject(),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     if (isNew)
                      //       IconText(
                      //         icon: AppIcons.star,
                      //         text: '${car.r ?? 0}',
                      //         textStyle: context.bodyMedium.copyWith(
                      //           color: context.yellow_00,
                      //         ),
                      //       ),
                      //     const Spacer(),
                      //     PriceWidget(
                      //       price: car.price ?? '0.0',
                      //       fontSize: 20,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
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
