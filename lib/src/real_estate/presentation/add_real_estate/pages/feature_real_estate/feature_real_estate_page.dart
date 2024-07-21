import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'feature_real_estate_screen.dart';


class FeatureRealEstatePage extends BaseBlocWidget<UnInitState,AddRealEstatePageCubit> {
  FeatureRealEstatePage({Key? key,}) : super(key: key);



   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    RealEstateArgs args = getArguments(context);
    return FeatureRealEstateScreen(
      onTapNext: (features){
        args.addRealEstateParams.features = features;
        pushNamed(Routes.addImageRealEstatePage,arguments: args);
      },
      categoriesDetails:  args.categoryDetailsDto,
      categoryName: args.categoryName,
    );
  }
}
