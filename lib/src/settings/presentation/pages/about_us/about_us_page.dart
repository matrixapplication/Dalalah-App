
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/about_us.dart';
import '../../../domain/entities/about_us_types_.dart';
import '../../bloc/about_us_bloc.dart';
import 'about_us_screen.dart';

class AboutUsPage extends BaseBlocWidget<DataSuccess<AboutUs>, AboutUsCubit> {
  AboutUsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    final type = getArguments<AboutUsTypes>(context);
    bloc.fetchInitialData(type!);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<AboutUs> state) {
    return AboutUsScreen(
      data: state.data ?? AboutUs(),
    );
  }

  @override
  String? title(BuildContext context) {
    final type = getArguments<AboutUsTypes>(context);
    if(type == AboutUsTypes.ABOUT_US) {
      return strings.about_us;
    } else if(type == AboutUsTypes.BUYING_AND_SELLING_ABOUT) {
      return strings.buying_and_selling_about;
    } else if(type == AboutUsTypes.TERMS_AND_CONDITIONS) {
      return strings.terms_and_conditions;
    } else if(type == AboutUsTypes.PRIVACY) {
      return strings.privacy_policy;
    } else {
      return '';
    }
  }

  @override
  onClickReload() {
    final type = getArguments<AboutUsTypes>(context!);
    bloc.fetchInitialData(type!);
  }
}
