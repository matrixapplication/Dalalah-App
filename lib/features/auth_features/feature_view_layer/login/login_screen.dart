import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/components/auth_bg.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/login/login_body/login_body.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/login/login_body/login_form.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/will_scoped.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillScopedScreen(
      onTap: (bool  ? value ){

      },
      child: const Scaffold(
        body: SafeArea(
          child: LoginBody(),
        ),
      ),

    );
  }
}




