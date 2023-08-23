
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/home_screen.dart';
import 'package:arabitac/generated/locale_keys.g.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../../../core/resources/resources.dart';


class BottomNavigationPage extends StatefulWidget {
  int selectedIndex;

  BottomNavigationPage({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {


  @override
  void initState() {

    super.initState();

  }
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            //  color: Colors.green,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            child: BottomNavigationBar(
              currentIndex: widget.selectedIndex,
              onTap: (index) async{
                setState((){
                  widget.selectedIndex = index ;
                }) ;
              },
              elevation: 2,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              iconSize: 10,
              backgroundColor: Colors.white,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              selectedLabelStyle: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w500 ) ,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeightManager.medium),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                  icon: CustomSvgImage(
                    image: AssetsManager.home,
                    height: 20.h,

                    color: widget.selectedIndex == 0
                        ? primaryColor
                        : null,
                  ),
                  label:  tr(LocaleKeys.home),
                ),
                BottomNavigationBarItem(
                  icon: CustomSvgImage(
                    image: AssetsManager.addCar,
                    height: 20.h,
                    color: widget.selectedIndex == 1
                        ? primaryColor
                        : null,
                  ),
                  label:  "Add Car",
                ),

                BottomNavigationBarItem(
                  icon: CustomSvgImage(
                    image: AssetsManager.notification,
                    height: 20.h,
                    color: widget.selectedIndex == 2
                        ? primaryColor
                        : null,
                  ),
                  label:  tr(LocaleKeys.notification),
                ),
                BottomNavigationBarItem(
                  icon: CustomSvgImage(
                    image: AssetsManager.profile,
                    height: 20.h,
                    color: widget.selectedIndex == 3
                        ? primaryColor
                        : null,
                  ),
                  label:  tr(LocaleKeys.profile),
                ),
              ],
            ),
          ),
        ),
        body: screens[widget.selectedIndex]);
  }
}
