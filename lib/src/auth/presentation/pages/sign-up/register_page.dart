import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'user_register_screen.dart';

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
    ));
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    return Container(
      alignment: Alignment.center,
      padding: 10.paddingAll,
      margin: 16.paddingHoriz + (180).paddingTop + 50.paddingBottom,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: Decorations.shapeDecorationShadow(
          colorShadow: context.primaryColor, radius: 30),
      child: TabBarScaffoldWidget(
        height: 25,
        marginTabs: 16.paddingHoriz + 16.paddingTop,
        tabs: [
          TabItemModel(
            label: context.strings.user,
            page: UserRegisterScreen(
              cities: state.data ?? [],
              onRegister: (RegisterParams params) {
                bloc.register(params);
              },
            ),
          ),
          TabItemModel(
            label: context.strings.showroom,
            page: UserRegisterScreen(
              isShowroom: true,
              cities: state.data ?? [],
              onRegister: (RegisterParams params) {
                bloc.registerAsShowroom(params);
              },
            ),
          ),
        ],
      ),
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
