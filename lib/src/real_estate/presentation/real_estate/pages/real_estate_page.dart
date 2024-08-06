import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../../../data/models/real_estate_params.dart';
import '../../add_real_estate/bloc/real_estate_categories_state.dart';
import '../bloc/real_estate_bloc.dart';
import 'real_estate_screen.dart';

class RealEstatePage extends BaseBlocWidget<UnInitState, RealEstatePageCubit> {
   final bool? showTitle;
   final RealEstateParams? filterParams;
   RealEstatePage( {Key? key,this.showTitle,this.filterParams,}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
     RealEstateParams params =RealEstateParams();
     RealEstateParams params2 =RealEstateParams();
     if(filterParams!=null){
       print('ffff ${filterParams!.propStatus}');
       params2.type=filterParams!.type;
        params2.status=filterParams!.propStatus;
       params2.categoryId=filterParams!.categoryId;
       params2.detailsIds=filterParams!.detailsIds;
       params2.detailsValues=filterParams!.detailsValues;
       bloc.fetchRealEstates(filterParams!);
     }else{
       bloc.fetchRealEstates(params);
     }
   }

   @override
   bool isAddButton() {
     return false;
   }
   @override
    onAddButtonPressed() {
     pushNamed(Routes.addRealEstatePage,);
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
   return
   //   Container(
   //   child: Center(
   //     child: Text('قريبا .... '),
   //   ),
   // );
     RealEstateScreen(
     realEstateCategoriesList:bloc.categoriesList,
     realEstatesData: bloc.realEstatesData,
     categoriesDetails: bloc.categoriesDetails,
     onGetDetailsType: (id)async{
       await bloc.fetchRealEstateCategoriesDetails(id);
     },
     onTapGetRealEstates: (RealEstateParams? params){
       print('ssss ${params!.toJson().toString()}');
       bloc.fetchRealEstates(params!);
     },

   );
  }

  @override
  String? title(BuildContext context) {
    return showTitle==false? '': strings.real_estates;
  }
}
