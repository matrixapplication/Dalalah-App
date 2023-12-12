import 'package:dalalah/src/auth/presentation/pages/login/widgets/login_body.dart';

import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends StatefulWidget {
  final Function(LoginParams)? onLogin;
  final Function(LoginParams)? onShowRoomLogin;

  const LoginScreen({Key? key, this.onLogin, this.onShowRoomLogin}) : super(key: key);

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
      child: TabBarWidget(
        height: 25,
        marginTabs: 16.paddingHoriz + 16.paddingTop,
        tabs: [
          TabItemModel(label: context.strings.individuals, page: LoginBody(onLogin: widget.onLogin)),
          TabItemModel(label: context.strings.merchant, page: LoginBody(isUser: false, onLogin: widget.onShowRoomLogin)),
        ],
      ),
    );
  }
}
