import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../main_index.dart';

class AuthWidget extends StatelessWidget {
  final Widget child;

  const AuthWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: context.height * 0.35,
          width: MediaQuery.of(context).size.width,
          padding: 40.paddingTop,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70))),
          child: Image.asset(AppImages.logo_white, ),
        ),
        Align(alignment: Alignment.center, child: child),
        PositionedDirectional(
            top: 40,
            start: 20,
            child: CustomBackButton(
    isPrimaryColor: false,
    ))
      ],
    );
  }
}
