import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/real_estate.dart';
import '../bloc/real_estate_bloc.dart';
import 'real_estate_screen.dart';

class RealEstatePage extends BaseBlocWidget<DataSuccess<List<Notifications>>, RealEstatePageCubit> {
   RealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchNotifications();
   }

   @override
   bool isAddButton() {
     return true;
   }
   @override
    onAddButtonPressed() {
     pushNamed(Routes.addRealStateScreen);
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Notifications>> state) {
   return RealEstateScreen(
     notifications: state.data!,
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.real_estate;
  }
}
