import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../add_real_estate/bloc/add_real_estate_bloc.dart';
import '../../add_real_estate/bloc/real_estate_categories_state.dart';
import '../../real_estate/bloc/real_estate_bloc.dart';
import '../../real_estate/pages/real_estate_page.dart';
import 'filter_real_estate_screen.dart';


class FilterRealEstatePage extends BaseBlocWidget<DataSuccess<RealEstateCategoriesState>,AddRealEstatePageCubit> {
  FilterRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }






   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<RealEstateCategoriesState> state) {
   return
     FilterRealEstateScreen(
     state:state.data!,
     categoriesDetails: bloc.categoriesDetailsStream,
     onGetDetailsType: (id)async{
       await bloc.fetchRealEstateCategoriesDetails(id);
     },
     onTapNext: (param,categoryName) {
      print(param.toJson().toString());
      bloc.fetchRealEstateCategories();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RealEstatePage(filterParams: param,)));
     }
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.detailed_research;
  }
}
