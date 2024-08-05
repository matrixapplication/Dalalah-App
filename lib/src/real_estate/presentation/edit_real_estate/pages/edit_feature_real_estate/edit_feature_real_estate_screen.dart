import 'package:dalalah/src/main_index.dart';
import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/widgets/buttons/stack_button.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../../../data/models/my_properties_response.dart';
import '../../widgets/feature_item_widget.dart';

class EditFeatureRealEstateScreen extends BaseStatelessWidget {
  final RealEstateCategoryDetailsDto categoriesDetails;
  final Function(List<String>)? onTapNext;
 final String categoryName;
 final Property property;
  EditFeatureRealEstateScreen( {super.key,required this.property,required this.categoryName, required this.categoriesDetails,this.onTapNext,});
  List<FeaturesDto> featuresDtoList =[];
  @override
  Widget build(BuildContext context) {
    final newList = property.features!.map((e) => FeaturesDto(id: e.id,name: e.name,icon: e.icon)).toList();
    featuresDtoList=newList;
    return StackButton(
      onPrevPressed: (){
        Navigator.pop(context);
      },
      onNextPressed: () {
        onTapNext!(featuresDtoList.map((e) => e.id?.toString() ?? '').toList());
      },
      child: Padding(
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
                  return FeatureItemWidget(
                    isSelected: property.features!.where((element) => element.id==categoriesDetails.features![index].id).isNotEmpty,
                    featuresDto: categoriesDetails.features![index],
                    onTap: (FeaturesDto featuresDto){
                      if(featuresDtoList.contains(featuresDto)){
                        featuresDtoList.remove(featuresDto);
                      }
                      else{
                        featuresDtoList.add(featuresDto);
                      }
                      },);
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
