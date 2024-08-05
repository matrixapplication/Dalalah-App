import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'add_images_real_estate.dart';

class AddImageRealEstatePage
    extends BaseBlocWidget<UnInitState, AddRealEstatePageCubit> {
  AddImageRealEstatePage({Key? key}) : super(key: key);

  @override
  Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    RealEstateArgs args = getArguments(context);
    return AddImagesRealEstateScreen(
      categoryName: args.categoryName,
      onShare: (param) {
        args.addRealEstateParams.images = param.images;
        args.addRealEstateParams.cover = param.cover;
        bloc.addRealEstate(args.addRealEstateParams);
      },
    );
  }
  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
