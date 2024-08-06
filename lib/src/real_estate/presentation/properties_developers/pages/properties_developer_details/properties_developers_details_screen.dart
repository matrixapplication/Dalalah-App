import 'package:dalalah/src/main_index.dart';
import '../../../../../../core/widgets/buttons/call_button.dart';
import '../../../../../../core/widgets/buttons/chat_whats_app_button.dart';
import '../../../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../../core/widgets/texts/row_texts.dart';
import '../../../../../cars/presentation/cars_details/widgets/sliders_car_details.dart';
import '../../../../../showrooms/presentation/showrooms/widgets/custom_exhibition_circle_logo.dart';
import '../../../../data/models/my_properties_response.dart';
import '../../../../data/models/properties_developer_details.dart';
import '../../../../data/models/properties_developers.dart';
import '../../../real_estate/widgets/real_estate_item.dart';

class PropertiesDevelopersDetailsScreen extends BaseStatelessWidget {
  final PropertiesDeveloperDetails developerDetails;
  final Function()? onAddRate;
  final Function()? onFollow;
  PropertiesDevelopersDetailsScreen({super.key,required this.developerDetails,this.onAddRate, this.onFollow, });

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
                images: [developerDetails.logo ?? ''],
              ),
              PrimaryButton(
                height: 40,
                width: 20,
                radius: 50,
                margin: 10.paddingTop + 10.paddingStart,
                padding: 12.paddingAll,
                title: developerDetails.isFollowed ==true
                    ? context.strings.follower
                    : context.strings.follow,
                onPressed: () {
                  onFollow?.call();
                },
              ),
              PositionedDirectional(
                top: 12,
                end: 12,
                child: CustomExhibitionCircleLogo(
                  logoPath: AppImages.splash_logo,
                  name: developerDetails.name ?? '',
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                end: 15,
                child: Row(
                  children: [
                    ChatWhatsAppButton(phone: developerDetails.whatsapp ?? ''),
                    10.pw,
                    CallButton(phone: developerDetails.phone ?? ''),
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
                  title: developerDetails.name ?? '',
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
                      text: developerDetails.city?.name ?? '',
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
                      text:developerDetails.avgRate??'',
                      textStyle: context.bodyMedium.copyWith(
                        color: context.yellow_00,
                      ),
                      onTap:  onAddRate
                    ),
                  ],
                ),

              ],
            ),
          ),
         if(developerDetails.properties!=null &&developerDetails.properties!.isNotEmpty)
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: 16.paddingHoriz+16.paddingVert,
               child: Text(
                 strings.real_estates,
                 style: theme.textTheme.bodyMedium!,
               ),
             ),
             ...developerDetails.properties!.map((e) => RealStateItemWidget(
               realEstate: e,
               isMyProperty: true,
             )),

           ],
         )
        ],
      ),
    );

   }
}
