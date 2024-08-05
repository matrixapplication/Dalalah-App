import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/real_estate/data/models/my_properties_response.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../../add_real_estate/bloc/add_real_estate_bloc.dart';
import '../../bloc/edit_real_estate_bloc.dart';
import '../../bloc/real_estate_categories_state.dart';
import 'edit_real_estate_screen.dart';


class EditRealEstatePage extends BaseBlocWidget<DataSuccess<EditRealEstateCategoriesState>, EditRealEstatePageCubit> {
  EditRealEstatePage({Key? key}) : super(key: key);

   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }



  @override
  Widget buildWidget(BuildContext context, DataSuccess<EditRealEstateCategoriesState> state) {

    Property? property = getArguments(context)  is Property?getArguments(context) : null;

     return EditRealStateScreen(
       property: property!,
       state: state.data!,
       onGetDetailsType: (id)async{
        await bloc.fetchRealEstateCategoriesDetails(id);
       },
       categoriesDetails: bloc.categoriesDetailsStream,
       onTapNext: (param,categoryName){
         print("first88 ${param.detailsList!.map((e) => e.title).toString()}");
         pushNamed(Routes.editRealEstateSecondPage, arguments: EditRealEstateArgs(
           categoryDetailsDto: state.data!.categoriesDetailsStream.data!,
           addRealEstateParams: param,
           categoryName: categoryName,
           property:property
         ));

       },
   );
  }
}
