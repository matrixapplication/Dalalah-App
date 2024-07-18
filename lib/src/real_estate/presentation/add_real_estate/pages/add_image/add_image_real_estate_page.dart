import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'add_images_real_estate.dart';


class AddImageRealEstatePage extends BaseBlocWidget<UnInitState, AddRealEstatePageCubit> {
  AddImageRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }


   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    AddRealEstateParams addRealEstateParams =getArguments(context);
    print("dddddddddddddd ${addRealEstateParams.toJson().toString()}");
   return AddImagesRealEstateScreen(

   );
  }


}
