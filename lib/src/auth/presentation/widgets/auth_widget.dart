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
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70))),
          child: Image.asset(AppImages.logo_white, ),
        ),
        Align(alignment: Alignment.center, child: child),
      ],
    );
  }
}
