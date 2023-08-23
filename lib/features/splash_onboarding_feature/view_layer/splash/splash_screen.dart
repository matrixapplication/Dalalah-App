
import 'package:arabitac/core/routing/navigation_services.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:flutter/material.dart';

import 'splash_body/splash_body.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3) , (){
      NavigationService.push(Routes.onBoarding) ;
    });

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}


