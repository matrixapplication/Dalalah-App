import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/buttons/stack_button.dart';
import '../../../../../../core/widgets/snack_bar/snack_bar_manager.dart';
import '../../../../../map_picker/widgets/custom_google_map.dart';
import '../../../../../profile/data/models/profile_dto.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../../../data/models/my_properties_response.dart';

class EditRealStateSecondScreen extends BaseStatelessWidget {
  final  RealEstateCategoryDetailsDto  categoryDetailsDto;
  final List<City> citiesList;
  final String categoryName;
  final Function(AddRealEstateParams params)? onTapNext;
  final Property property;
  EditRealStateSecondScreen(  {super.key,required this.property,required this.categoryName,this.onTapNext,required this.categoryDetailsDto,required this.citiesList,});
  LatLng? initialLocation;
  int cityId = 0;
  String price='';
  String description='';
  String street='';
  @override
  Widget build(BuildContext context) {
    price=property.price.toString()??'';
    description=property.description??'';
    street=property.streetName??'';
    cityId=property.city?.id??0;
    initialLocation=LatLng(double.parse(property.lat??''),double.parse(property.lng??''));
    List<DropDownItem> items = [
      const DropDownItem(id: '1', title: 'جده'),
      const DropDownItem(id: '2', title: 'الرياض'),
    ];
    return StackButton(
      onPrevPressed: (){
        Navigator.pop(context);
      },
      onNextPressed: () {
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
      child: SingleChildScrollView(
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
                 controller: TextEditingController(text: property.price.toString()),
                 keyboardType: TextInputType.number,
                 hintText: '${strings.enter_price_real_estate} $categoryName',
                 onChanged: (val){
                   price=val;
                 },
               ),
                16.ph,
                CustomTextField(
                  title: '${strings.description2} $categoryName',
                  hintText: '${strings.enter_description_real_estate} $categoryName',
                  maxLength: 2000,
                  controller: TextEditingController(text: property.description??''),
                  keyboardType: TextInputType.multiline,
                  isHasConstraints: false,
                  onChanged: (val){
                    description=val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return strings.enter_car_description;
                    } else if (value.length > 2000) {
                      return strings.only_2000_characters_allowed;
                    }
                    return null;
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
                    valueId: property.city?.id??0,
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
                  controller: TextEditingController(text: property.streetName??''),
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
                  initialLocation: LatLng(double.parse(property.lat??''),double.parse(property.lng??'')),
                  onGetLocation: (lat, lng) {
                    initialLocation = LatLng(lat, lng);
                  },
                ),

              ],
            ),
          ),

      ),
    );
  }

}
