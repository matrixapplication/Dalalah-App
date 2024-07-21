import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/snack_bar/snack_bar_manager.dart';
import '../../../../../map_picker/widgets/custom_google_map.dart';
import '../../../../../profile/data/models/profile_dto.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';

class AddRealStateSecondScreen extends BaseStatelessWidget {
  final  StreamStateInitial<RealEstateCategoryDetailsDto?>  categoryDetailsDto;
  final List<City> citiesList;
  final String categoryName;
  final Function(AddRealEstateParams params)? onTapNext;

  AddRealStateSecondScreen(  {super.key,required this.categoryName,this.onTapNext,required this.categoryDetailsDto,required this.citiesList,});
  LatLng? initialLocation;
//getProfile
  int cityId = 0;
  String price='';
  String description='';
  String street='';
  @override
  Widget build(BuildContext context) {

    List<DropDownItem> items = [
      const DropDownItem(id: '1', title: 'جده'),
      const DropDownItem(id: '2', title: 'الرياض'),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.paddingHoriz+60.paddingTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${strings.add} $categoryName',
                style: titleSmall,
              ),
              20.ph,
              Text('${strings.price2} $categoryName',
                style: labelMedium.copyWith(
                  color: Colors.black
                ),
              ),
             16.ph,
             CustomTextField(
               hintText: '${strings.enter_price_real_estate} $categoryName',
               onChanged: (val){
                 price=val;
               },
             ),
              16.ph,
              Text('${strings.description2} $categoryName',
                style: labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              16.ph,
              CustomTextField(
                hintText: '${strings.enter_description_real_estate} $categoryName',
                onChanged: (val){
                  description=val;
                },
              ),
              16.ph,
              Text('${strings.address2} $categoryName',
                style: labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              16.ph,
              Text(strings.city,
                style: labelSmall.copyWith(
                    color: primaryColor
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DropDownField(
                  items: citiesList.map((e) =>
                      DropDownItem(id: e.id?.toString() ?? '', title: e.name))
                      .toList(),
                  hint: context.strings.city,
                  prefixIcon: AppIcons.location_2,
                  isDecoration: false,
                  onChanged: (value) {
                    cityId = int.parse(value?.id ?? '0');
                  },
                ),
              ),
              20.ph,
              Text(strings.street,
                style: labelMedium.copyWith(
                  color: primaryColor
                ),
              ),
              8.ph,
              CustomTextField(
                onChanged: (val){
                  street=val;
                },
              ),
              16.ph,
              Text(strings.location,
                style: labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              8.ph,
              CustomGoogleMap(
                initialLocation: initialLocation,
                onGetLocation: (lat, lng) {
                  initialLocation = LatLng(lat, lng);
                },
              ),
              50.ph,
              PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.cancel,
            onPressed1: () {
              if (initialLocation == null || initialLocation!.latitude == 0.0 || initialLocation!.longitude == 0.0) {
                SnackBarManager.showErrorSnackBar(strings.please_select_real_estate_location);
                return;
              }else{
                AddRealEstateParams addRealEstateParams=AddRealEstateParams(
                  price: price,
                  description: description,
                  cityId: cityId,
                  streetName: street,
                  lat: initialLocation!.latitude.toString(),
                  lng: initialLocation!.longitude.toString(),
                );
                onTapNext!(addRealEstateParams);
              }
            },
            onPrevPressed: () {

            },
          ),
              50.ph,
            ],
          ),
        ),
      ),
    );
  }

}
