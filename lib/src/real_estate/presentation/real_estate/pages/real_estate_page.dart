import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../bloc/real_estate_bloc.dart';
import 'real_estate_screen.dart';

class RealEstatePage extends BaseBlocWidget<UnInitState, RealEstatePageCubit> {
   RealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
     bloc.fetchRealEstates(AddRealEstateParams(
       type: 'sell',
       status: 'rent',
     ));
   }

   @override
   bool isAddButton() {
     return true;
   }
   @override
    onAddButtonPressed() {
     // bloc.fetchRealEstates(AddRealEstateParams(
     //   type: 'sell',
     //   status: 'rent',
     // ));
     pushNamed(Routes.addRealEstatePage, );
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
   return RealEstateScreen(
     realEstateCategoriesList:bloc.categoriesList,
     realEstatesData: bloc.realEstatesData,
     categoriesDetails: bloc.categoriesDetails,
     onGetDetailsType: (id)async{
       await bloc.fetchRealEstateCategoriesDetails(id);
     },

   );
  }

  @override
  String? title(BuildContext context) {
    return strings.real_estates;
  }
}
