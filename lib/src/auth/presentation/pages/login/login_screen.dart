import 'package:arabitac/src/auth/presentation/pages/login/widgets/login_body.dart';

import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends StatefulWidget {
  final Function(LoginParams)? onLogin;

  const LoginScreen({Key? key, this.onLogin}) : super(key: key);

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

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      padding: 20.paddingHoriz + 8.paddingTop,
      height: 0.65.sh,
      margin: 16.paddingHoriz + 10.paddingTop,
      decoration: Decorations.shapeDecorationShadow(colorShadow: context.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                TabItemModel(label: context.strings.user, page: LoginBody(onLogin: widget.onLogin,formKey: formKey,)),
                TabItemModel(label: context.strings.exhibition, page: LoginBody(isUser: false, onLogin: widget.onLogin,formKey: formKey,)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
