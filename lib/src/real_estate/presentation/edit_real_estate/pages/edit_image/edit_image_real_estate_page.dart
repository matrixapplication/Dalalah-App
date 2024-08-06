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
        if(param.images!=null){
          args.addRealEstateParams.images = param.images;
        }
        if(param.cover!=null){
          args.addRealEstateParams.cover = param.cover;
        }
        print('objffect ${args.addRealEstateParams.toJson().toString()}');
        bloc.editRealEstate(args.addRealEstateParams, args.property.id);
      },
      onAddPropertyImage: (images,id) {
        // params.carId = args.car?.id;
        bloc.addPropertyImage(images,id);
      },
      onEditPropertyImage: (images,id) {
        // params.carId = args.car?.id;
        bloc.addPropertyImage(images,id);
        // bloc.editPropertyImage(images,id);
      },
      onDeletePropertyImage: (id) {
        bloc.deletePropertyImage(id);
      },
    );
  }
  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
