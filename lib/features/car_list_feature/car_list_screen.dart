import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'body/car_list_body.dart';

class CarListScreen extends StatefulWidget {
  final String title;
  const CarListScreen({Key? key, required this.title}) : super(key: key);
  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const SafeArea(
        child: CarListBody(),
      ),
      appBar: PreferredSize(preferredSize: Size.fromHeight(40.h), child: CustomAppBar(title: widget.title ,)),
    );
  }
}





