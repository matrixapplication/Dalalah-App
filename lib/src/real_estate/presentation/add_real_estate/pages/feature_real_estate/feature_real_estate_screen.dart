import 'package:dalalah/src/main_index.dart';
import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../widgets/feature_item_widget.dart';

class FeatureRealEstateScreen extends BaseStatelessWidget {
  final RealEstateCategoryDetailsDto categoriesDetails;
  final Function(List<String>)? onTapNext;
 final String categoryName;
  FeatureRealEstateScreen( {super.key,required this.categoryName, required this.categoriesDetails,this.onTapNext,});
  List<FeaturesDto> featuresDtoList =[];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingHoriz+60.paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${strings.add} $categoryName',
            style: titleSmall,
          ),
          20.ph,
          Text('${strings.add_feature_real_estate} $categoryName',
            style: labelMedium.copyWith(
                color: Colors.grey
            ),
          ),
          20.ph,
          Expanded(
            child:
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              padding: 10.paddingHoriz,
              itemCount: categoriesDetails.features!.length,
              itemBuilder: (BuildContext context, int index) {
                return FeatureItemWidget(featuresDto: categoriesDetails.features![index],
                  onTap: (FeaturesDto featuresDto){
                    if(featuresDtoList.contains(featuresDto)){
                      featuresDtoList.remove(featuresDto);
                    }else{
                      featuresDtoList.add(featuresDto);
                    }
                    print("ddd ${featuresDtoList.map((e) => e.name)}");
                  },);
              },
            ),
          ),
          40.ph,
          PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.back,
            onPressed1: () {
              onTapNext!(featuresDtoList.map((e) => e.id?.toString() ?? '').toList());
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
