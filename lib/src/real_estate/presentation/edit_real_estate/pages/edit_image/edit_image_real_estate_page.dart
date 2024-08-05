import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/edit_real_estate_bloc.dart';
import 'edit_images_real_estate.dart';

class EditImageRealEstatePage
    extends BaseBlocWidget<UnInitState, EditRealEstatePageCubit> {
  EditImageRealEstatePage({Key? key}) : super(key: key);

  @override
  Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    EditRealEstateArgs args = getArguments(context);
    return EditImagesRealEstateScreen(
      property: args.property,
      categoryName: args.categoryName,
      onShare: (param) {
        print('ddddddd');
        // args.addRealEstateParams.images = param.images;
        // args.addRealEstateParams.cover = param.cover;
        print('objffect ${args.addRealEstateParams.toJson().toString()}');
        bloc.editRealEstate(args.addRealEstateParams, args.property.id);
      },
      onAddPropertyImage: (params) {
        // params.carId = args.car?.id;
        // bloc.addCarImage(params);
      },
      onEditPropertyImage: (params) {
        // params.carId = args.car?.id;
        // bloc.editCarImage(params);
      },
      onDeletePropertyImage: (id) {
        // bloc.deleteImage(id);
      },
    );
  }
  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
