import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';

import '../../../../../main_index.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../../../../../sell_car/domain/entities/district.dart';
import '../../../../data/models/add_branch_params.dart';
import '../../../../domain/entities/branch.dart';

class AddBranchesScreen extends BaseStatelessWidget {
  final Branch? initialBranch;
  final List<City> cities;
  final StreamStateInitial<List<District>> districtsStream;
  final Function(int)? onFetchDistricts;
  final Function(AddBranchParams)? onAddBranch;

  AddBranchesScreen(
      {super.key,
      this.initialBranch,
      required this.cities,
        required this.onFetchDistricts,
      required this.districtsStream,
      this.onAddBranch});

  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController addressArController = TextEditingController();
  TextEditingController addressEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  int cityId = 0;
  int districtId = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _initData();
    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              title: strings.name_ar,
              hintText: strings.name_ar,
              controller: nameArController,
            ),
            CustomTextField(
              title: strings.name_en,
              hintText: strings.name_en,
              controller: nameEnController,
            ),
            CustomTextField(
              title: strings.address_ar,
              hintText: strings.address_ar,
              controller: addressArController,
            ),
            CustomTextField(
              title: strings.address_en,
              hintText: strings.address_en,
              controller: addressEnController,
            ),
            CustomTextField(
              title: strings.phone_number,
              hintText: strings.phone_number,
              controller: phoneController,
            ),
            CustomTextField(
              title: strings.whatsapp,
              hintText: strings.whatsapp,
              controller: whatsappController,
            ),
            CustomTextField(
              title: strings.link,
              hintText: strings.link,
              controller: linkController,
            ),
            DropDownField(
              title: strings.city,
              hint: strings.city,
              items: cities
                  .map((e) =>
                      DropDownItem(id: e.id.toString(), title: e.name ?? ''))
                  .toList(),
              onChanged: (value) {
                cityId = int.parse(value?.id ?? '0');
                onFetchDistricts?.call(cityId);
              },
            ),
            StreamBuilder<List<District>>(
                stream: districtsStream.stream,
                builder: (context, snapshot) {
                  return DropDownField(
                    title: strings.district,
                    hint: strings.district,
                    items: snapshot.data
                            ?.map((e) => DropDownItem(
                                id: e.id.toString(), title: e.name ?? ''))
                            .toList() ??
                        [],
                    onChanged: (value) {
                      districtId = int.parse(value?.id ?? '0');
                    },
                  );
                }),
            PrimaryButton(
              title: strings.add_branch,
              margin: 20.paddingTop,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onAddBranch?.call(AddBranchParams(
                    nameAr: nameArController.text,
                    nameEn: nameEnController.text,
                    addressAr: addressArController.text,
                    addressEn: addressEnController.text,
                    phone: phoneController.text,
                    whatsapp: whatsappController.text,
                    link: linkController.text,
                    cityId: cityId,
                    districtId: districtId,
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _initData() {
    if (initialBranch != null) {
      nameArController.text = initialBranch?.name ?? '';
      nameEnController.text = initialBranch?.name ?? '';
      addressArController.text = initialBranch?.address ?? '';
      addressEnController.text = initialBranch?.address ?? '';
      phoneController.text = initialBranch?.phone ?? '';
      whatsappController.text = initialBranch?.whatsapp ?? '';
      linkController.text = initialBranch?.link ?? '';
      cityId = initialBranch?.cityId ?? 0;
      districtId = initialBranch?.districtId ?? 0;
    }
  }
}
