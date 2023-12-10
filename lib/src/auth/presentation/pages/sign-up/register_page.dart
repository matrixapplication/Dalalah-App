import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseBlocWidget<DataSuccess<List<City>>, AuthCubit> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: AuthWidget(
        child: buildConsumer(context),
      ),
    );
  }


  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    return RegisterScreen(
      cities: state.data ?? [],
      onRegister: (RegisterParams params) {
        bloc.register(params);
        //Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
      },
    );
  }

  @override
  bool? resizeToAvoidBottomInset(BuildContext context) {
    return false;
  }

  @override
  onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
