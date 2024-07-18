import 'package:dalalah/src/main_index.dart';
import '../../../../../../../core/utils/helper_methods.dart';
import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../../core/widgets/choose_from_list_widget.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../widgets/feature_item_widget.dart';

class FeatureRealEstateScreen extends BaseStatelessWidget {
  final StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails;
  final Function(AddRealEstateParams params)? onTapNext;

  FeatureRealEstateScreen( {super.key, required this.categoriesDetails,this.onTapNext,});
  List<FeaturesDto> featuresDtoList =[];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingHoriz+60.paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(strings.add_real_estate,
            style: titleSmall,
          ),
          20.ph,
          Text(strings.add_feature_real_estate,
            style: labelMedium.copyWith(
                color: Colors.grey
            ),
          ),
          20.ph,
          Expanded(
            child: StreamBuilder<RealEstateCategoryDetailsDto?>(
                stream: categoriesDetails.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return snapshot.connectionState == ConnectionState.waiting
                      ||data==null
                      ? const LoadingView()
                      :
                  Padding(
                    padding: 10.paddingHoriz,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: data.features!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FeatureItemWidget(featuresDto: data.features![index],
                          onTap: (FeaturesDto featuresDto){
                          if(featuresDtoList.contains(featuresDto)){
                            featuresDtoList.remove(featuresDto);
                          }else{
                            featuresDtoList.add(featuresDto);
                          }
                          print("ddd ${featuresDtoList.map((e) => e.name)}");
                        },);
                      },
                    ),);
                }),
          ),
          40.ph,
          PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.back,
            onPressed1: () {
              AddRealEstateParams addRealEstateParams=AddRealEstateParams(
                  features: featuresDtoList.map((e) => e.id!).toList(),

              );
              onTapNext!(addRealEstateParams);
            },
            onPrevPressed: () {

            },
          ),
          40.ph,

        ],
      ),
    );
  }
}
