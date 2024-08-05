import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/edit_real_estate_bloc.dart';
import 'edit_feature_real_estate_screen.dart';


class EditFeatureRealEstatePage extends BaseBlocWidget<UnInitState,EditRealEstatePageCubit> {
  EditFeatureRealEstatePage({Key? key,}) : super(key: key);



   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    EditRealEstateArgs args = getArguments(context);
    return EditFeatureRealEstateScreen(
      onTapNext: (features){
        args.addRealEstateParams.features = features;
        print('ttttt ${args.addRealEstateParams.toJson().toString()}');

        pushNamed(Routes.editImageRealEstatePage,arguments: args);
      },
      categoriesDetails:  args.categoryDetailsDto,
      categoryName: args.categoryName,
      property: args.property,
    );
  }
}
