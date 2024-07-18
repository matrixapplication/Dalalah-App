import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/real_estate_type_dto.dart';
import '../../../../domain/entities/real_estate.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'add_real_estate_screen.dart';


class AddRealEstatePage extends BaseBlocWidget<UnInitState, AddRealEstatePageCubit> {
  AddRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }


   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
   return AddRealStateScreen(
     realEstateCategoriesList:bloc.categoriesList,
     onGetDetailsType: (id)async{
      await bloc.fetchRealEstateCategoriesDetails(id);
     },
     categoriesDetails:bloc.categoriesDetails,
     onTapNext: (param){

       pushNamed(Routes.addRealEstateSecondPage,arguments:{'categoriesDetails':bloc.categoriesDetails,'param':param});
     },
   );
  }


}
