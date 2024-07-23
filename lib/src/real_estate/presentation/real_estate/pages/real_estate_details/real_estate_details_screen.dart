import 'package:dalalah/src/favorites_and_ads/presentation/widgets/chip_ad.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/map_picker/widgets/custom_google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../../../core/widgets/images/image_network.dart';
import '../../../../../cars/presentation/cars_details/widgets/ad_numbering.dart';
import '../../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../data/models/real_estate_model.dart';
import '../../widgets/advantages_item.dart';
import '../../widgets/real_details_item.dart';


class RealEstateDetailsScreen extends BaseStatelessWidget {
  final Properties realEstate;

  RealEstateDetailsScreen( {super.key,required this.realEstate,});
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
                  images: realEstate.images?.map((e) => e.image??'').toList()??[],
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
                                      realEstate.price.toString()??'',
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
                                      ChipAd(
                                        text:  realEstate.category?.name??'',
                                      ),
                                      5.pw,
                                      ChipAd(
                                        text: realEstate.propStatusName??'',
                                      ),
                                      5.pw,
                                      ChipAd(
                                        text: realEstate.typeName??'',
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
                                text:realEstate.title??'',
                                textStyle: bodySmall,
                                icon: AppIcons.location,
                                iconSize: 20,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                            ),
                            16.ph,
                            Row(
                              children: [
                                const ImageNetworkCircle(
                                  image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/800px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg',
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
                                    5.ph,
                                    Text('رقم الترخيص: 123456',
                                      style: bodySmall.copyWith(
                                          color: Colors.grey,
                                        fontSize: 12
                                      ),
                                    ),

                                  ],
                                ),
                                const Spacer(),
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
                            Text(strings.description,
                              style: bodyMedium,
                            ),
                            8.ph,
                            Text(realEstate.description??'',
                              style: bodySmall.copyWith(
                                color: Colors.grey,
                                fontSize: 10
                              ),
                            ),
                            16.ph,
                            Text(strings.details,
                              style: bodyMedium,
                            ),
                            10.ph,
                            RealDetailsItem(icon:AppIcons.pyano, title: '${strings.type}:', text: realEstate.category?.name??'',),
                            ...realEstate.details?.map((e) =>
                                     RealDetailsItem(icon:AppIcons.up, title: '${e.name??''}:', text: e.option??''),).toList()??[],
                            10.ph,
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            6.ph,

                            if(realEstate.features !=null && realEstate.features!.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(strings.advantages,
                                  style: bodyMedium,
                                ),
                                Padding(
                                  padding: 16.paddingTop+10.paddingBottom,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ...realEstate.features?.map((e) => AdvantagesItem(icon: e.icon??'', text:  e.name??'',)).toList()??[],
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade300,
                                ),
                                6.ph,
                              ],
                            ),
                            AdNumbering(
                              margin: EdgeInsets.zero,
                              id: realEstate.id ?? 0,
                            ),
                            10.ph,
                            Text(strings.location,
                              style: bodyMedium,
                            ),
                            16.ph,
                            CustomGoogleMap(
                              initialLocation: LatLng(double.parse(realEstate.lat.toString()??''), double.parse(realEstate.lng.toString()??'')),
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
