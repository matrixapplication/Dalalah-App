import 'package:dalalah/src/favorites_and_ads/presentation/widgets/chip_ad.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/map_picker/widgets/custom_google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../../core/widgets/images/image_network.dart';
import '../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../widgets/advantages_item.dart';
import '../widgets/real_details_item.dart';


class RealEstateDetailsScreen extends BaseStatelessWidget {
   RealEstateDetailsScreen({super.key});
  List<String> items =[
    'https://images5.alphacoders.com/929/thumb-1920-929995.jpg',
    'https://images5.alphacoders.com/929/thumb-1920-929995.jpg',
    'https://images5.alphacoders.com/929/thumb-1920-929995.jpg',
    'https://images5.alphacoders.com/929/thumb-1920-929995.jpg',
  ];
   LatLng? initialLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SlidersCarDetails(
                  height: 375,
                  images: items,
                ),
                Column(
                  children: [
                    320.ph,
                    Container(
                      decoration: Decorations.kDecorationRadius(
                        radius: 25,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:16.paddingAll+16.paddingTop,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '15000',
                                      style: bodySmall,
                                    ),
                                    Text(
                                      ' ${context.strings.rs}',
                                      style: bodySmall,
                                    ),
                                  ],
                                ),

                                const Spacer(),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: [
                                      const ChipAd(
                                        text:  "فيلا",
                                      ),
                                      5.pw,
                                      const ChipAd(
                                        text: "جديد",
                                      ),
                                      const ChipAd(
                                        text:  "للبيع",
                                        // backgroundColor: context.errorColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            5.ph,
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: IconText(
                                text:  'شارع اسماعيل, حي البساتين, جده',
                                textStyle: bodySmall,
                                icon: AppIcons.location,
                                iconSize: 20,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                            ),
                            16.ph,
                            Row(
                              children: [
                                ImageNetworkCircle(
                                  image: items[0],
                                  size: 65,
                                ),
                                12.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('المعلن',
                                    style: bodySmall.copyWith(
                                      color: Colors.grey
                                    ),
                                    ),
                                    Text('صالح علي',
                                    style: bodyMedium,
                                    ),

                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.blue_49,
                                  child:
                                  const Icon(Icons.message,color: Colors.white,size: 18,),
                                ),
                                10.pw,
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.blue_49,
                                  child:
                                  const Icon(Icons.phone,color: Colors.white,size: 18,),
                                )
                              ],
                            ),
                            10.ph,
                            Text('الوصف',
                              style: bodyMedium,
                            ),
                            8.ph,
                            Text('عقارات فخمة ومميزة. استمتع بالرفاهية بسعر أقل عقارات فخمة ومميزة. استمتع بالرفاهية بسعر أقل عقارات فخمة ومميزة. استمتع بالرفاهية بسعر أقل ',
                              style: bodySmall.copyWith(
                                color: Colors.grey,
                                fontSize: 10
                              ),
                            ),
                            16.ph,
                            Text('التفاصيل',
                              style: bodyMedium,
                            ),
                            10.ph,
                            RealDetailsItem(icon:AppIcons.pyano, title: 'نوع العقار:', text: 'فيلا',),
                            RealDetailsItem(icon:AppIcons.up, title: 'مساحة العقار:', text: '53 m',),
                            RealDetailsItem(icon:AppIcons.up, title: 'التشطيب:', text: 'سوبر لوكس',),
                            RealDetailsItem(icon:AppIcons.up, title: 'غرف النوم:', text: '6',),
                            RealDetailsItem(icon:AppIcons.up, title: 'الحمامات:', text: '3',),
                            10.ph,
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            6.ph,
                            Text('المميزات',
                              style: bodyMedium,
                            ),
                            16.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AdvantagesItem(icon: AppIcons.pyano, text: 'بيانو',),
                                AdvantagesItem(icon: AppIcons.tak, text: 'تكييف',),
                                AdvantagesItem(icon: AppIcons.up, text: 'مصعد',),
                                AdvantagesItem(icon: AppIcons.tak2, text: 'تكييف',),
                              ],
                            ),
                            10.ph,
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            6.ph,
                            Text('الموقع',
                              style: bodyMedium,
                            ),
                            16.ph,
                            CustomGoogleMap(
                              initialLocation: initialLocation,
                              onGetLocation: (lat, lng) {
                                initialLocation = LatLng(lat, lng);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
