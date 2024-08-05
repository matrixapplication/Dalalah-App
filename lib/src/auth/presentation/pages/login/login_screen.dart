import 'package:dalalah/src/auth/presentation/pages/login/widgets/login_body.dart';

import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../installment/domain/entities/roles.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends StatefulWidget {
  final Function(LoginParams)? onLogin;
  final Function(LoginParams)? onShowRoomLogin;
  final Function(LoginParams)? onRealEstateDevelopersLogin;

  const LoginScreen({Key? key, this.onLogin, this.onShowRoomLogin, this.onRealEstateDevelopersLogin}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: 10.paddingAll,
      margin: 16.paddingHoriz + (180).paddingTop + 50.paddingBottom,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: Decorations.shapeDecorationShadow(colorShadow: context.primaryColor, radius: 30),
      child: TabBarScaffoldWidget(
        height: 25,
        marginTabs: 16.paddingHoriz + 16.paddingTop,
        tabs: [
          TabItemModel(label: context.strings.individuals, page: LoginBody(onLogin: widget.onLogin,type: Roles.USER,)),
          TabItemModel(label: context.strings.merchant, page: LoginBody(type: Roles.SHOWROOM, onLogin: widget.onShowRoomLogin)),
          // TabItemModel(label: context.strings.real_estate_developers, page: LoginBody(type: Roles.REALESTATEDEVELOPERS, onLogin: widget.onRealEstateDevelopersLogin)),
        ],
      ),
    );
  }
}
