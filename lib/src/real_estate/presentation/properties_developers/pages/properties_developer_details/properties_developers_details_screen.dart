import 'package:dalalah/src/main_index.dart';
import '../../../../../../core/widgets/buttons/call_button.dart';
import '../../../../../../core/widgets/buttons/chat_whats_app_button.dart';
import '../../../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../../core/widgets/texts/row_texts.dart';
import '../../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../../showrooms/presentation/showrooms/widgets/custom_exhibition_circle_logo.dart';
import '../../../../data/models/my_properties_response.dart';
import '../../../../data/models/properties_developers.dart';
import '../../../real_estate/widgets/real_estate_item.dart';

class PropertiesDevelopersDetailsScreen extends BaseStatelessWidget {
  final PropertiesDevelopers developer;
  final List<Property> properties;

  PropertiesDevelopersDetailsScreen( {super.key, required this.developer,required this.properties,});

   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SlidersCarDetails(
                height: 300,
                images: [developer.logo ?? ''],
              ),
              // PrimaryButton(
              //   height: 40,
              //   width: 20,
              //   radius: 50,
              //   margin: 10.paddingTop + 10.paddingStart,
              //   padding: 12.paddingAll,
              //   title: '4',
              //   onPressed: () {
              //     // onFollow?.call();
              //   },
              // ),
              PositionedDirectional(
                top: 12,
                end: 12,
                child: CustomExhibitionCircleLogo(
                  logoPath: AppImages.splash_logo,
                  name: developer.name ?? '',
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                end: 15,
                child: Row(
                  children: [
                    ChatWhatsAppButton(phone: developer.whatsapp ?? ''),
                    10.pw,
                    CallButton(phone: developer.phone ?? ''),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: 15.paddingHoriz+10.paddingBottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                RowTexts(
                  title: developer.name ?? '',
                  value:
                  '',
                  titleStyle: context.bodyLarge,
                  valueStyle: context.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconText(
                      text: developer.city?.name ?? '',
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
                      text: '',
                      textStyle: context.bodyMedium.copyWith(
                        color: context.yellow_00,
                      ),
                      onTap: () async {
                        // onAddRate?.call();
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: 16.paddingHoriz+16.paddingVert,
            child: Text(
              strings.real_estates,
              style: theme.textTheme.bodyMedium!,
            ),
          ),
          // ...properties.map((e) => RealStateItemWidget(
          //   realEstate: e,
          //   isMyProperty: false,
          // )),

        ],
      ),
    );

   }
}
