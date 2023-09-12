
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../bloc/about_logeste_bloc.dart';
import 'about_us_screen.dart';

class AboutUsPage extends BaseBlocWidget<DataSuccess<String>, AboutLogesteCubit> {
  AboutUsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAbout();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<String> state) {
    return AboutUsScreen(
      aboutLogeste: state.data ?? '',
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.about_us;
  }
}
