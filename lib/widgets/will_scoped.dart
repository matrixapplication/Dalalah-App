import 'package:flutter/material.dart';

class WillScopedScreen extends StatelessWidget {
  final Widget child ;
  final Function(bool?)? onTap ;
  const WillScopedScreen({
    super.key, required this.child, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: ()async{
      onTap!(false);

      return false ;
    });
  }
}