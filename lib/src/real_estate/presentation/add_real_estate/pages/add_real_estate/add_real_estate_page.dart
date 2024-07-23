import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/real_estate_type_dto.dart';
import '../../../../domain/entities/real_estate.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/add_real_estate_bloc.dart';
import '../../bloc/real_estate_categories_state.dart';
import 'add_real_estate_screen.dart';


class AddRealEstatePage extends BaseBlocWidget<DataSuccess<RealEstateCategoriesState>, AddRealEstatePageCubit> {
  AddRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }



  @override
  Widget buildWidget(BuildContext context, DataSuccess<RealEstateCategoriesState> state) {
   return AddRealStateScreen(
     state: state.data!,
     onGetDetailsType: (id)async{
      await bloc.fetchRealEstateCategoriesDetails(id);
     },
     categoriesDetails: bloc.categoriesDetailsStream,
     onTapNext: (param,categoryName){
       pushNamed(Routes.addRealEstateSecondPage, arguments: RealEstateArgs(
         categoryDetailsDto: state.data!.categoriesDetailsStream.data!,
         addRealEstateParams: param,
         categoryName: categoryName,
       ));
     },
   );
  }
}
