import 'package:arabitac/src/auth/presentation/pages/login/widgets/login_body.dart';

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
      padding: 20.paddingHoriz + 8.paddingTop,
      height: 480,
      margin: 16.paddingHoriz + (kToolbarHeight).paddingTop,
      decoration: Decorations.shapeDecorationShadow(colorShadow: context.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.strings.welcome,
              style:
              context.titleLarge.copyWith(color: context.outlineVariant)),

          Text(context.strings.please_login_to_your_account,
              style:
              context.bodyMedium.copyWith(color: context.outlineVariant)),
          16.ph,
          Expanded(
            child: TabBarWidget(
              height: 10,
              tabs: [
                TabItemModel(label: context.strings.user, page: LoginBody(onLogin: widget.onLogin)),
                TabItemModel(label: context.strings.exhibition, page: LoginBody(isUser: false, onLogin: widget.onShowRoomLogin)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
