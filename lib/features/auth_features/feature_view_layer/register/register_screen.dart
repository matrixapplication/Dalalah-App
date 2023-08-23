
import 'package:arabitac/features/auth_features/feature_view_layer/login/login_body/login_body.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/register/register_body/register_body.dart';

import 'package:arabitac/widgets/will_scoped.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterBody(),
      ),
    );
  }
}




