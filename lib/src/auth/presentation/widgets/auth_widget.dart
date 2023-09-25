import '../../../main_index.dart';

class AuthWidget extends StatelessWidget {
  final Widget child;
  const AuthWidget(
      {Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 300.h,
          width: MediaQuery.of(context).size.width,
          padding: 10.paddingTop,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70.r),
                  bottomRight: Radius.circular(70.r))),
          child: Image.asset(AppImages.logo_white, width: 280.w),
        ),
        Align(
alignment: Alignment.center,
            child: child),
      ],
    );
  }
}
