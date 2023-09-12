
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/buttons/contact_social_buttons.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../../cars/bloc/cars_bloc.dart';
import 'cars_details_screen.dart';

class CarsDetailsPage extends BaseBlocWidget<DataSuccess<List<Task>>, CarsCubit>{
  CarsDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchTasks();
  }

  @override
  String? title(context) => strings.car_details;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Task>> state) {
    return CarsDetailsScreen(
      tasks: state.data ?? [],
    );
  }


  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: Decorations.shapeTopShadow(
        color: context.scaffoldBackgroundColor,
        colorShadow: context.disabledColor,
        radius: 0,
      ),
      child: const ContactSocialButtons(
        phone: '+201141475581',
      ),
    );
  }

}
