import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../map_picker/widgets/custom_google_map.dart';

class AddRealStateSecondScreen extends BaseStatelessWidget {
  AddRealStateSecondScreen({super.key});
  LatLng? initialLocation;

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
              Text(strings.add_real_estate,
                style: titleSmall,
              ),
              20.ph,
              Text(strings.price_real_estate,
                style: labelMedium.copyWith(
                  color: Colors.black
                ),
              ),
             16.ph,
             CustomTextField(
               hintText: strings.enter_price_real_estate,
             ),
              16.ph,
              Text(strings.description_real_estate,
                style: labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              16.ph,
              CustomTextField(
                hintText: strings.enter_description_real_estate,
              ),
              16.ph,
              Text(strings.address_real_estate,
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
                  hint: '',
                  valueId: 5,
                  items: items.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                  onChanged: (item) {
                    // brandId = int.parse(item?.id ?? '0');
                    // onFetchBrandModels?.call(brandId);
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
              CustomTextField(),
              16.ph,
              Text(strings.location_real_estate,
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
              pushNamed(Routes.addImagesRealEstateScreen);
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
