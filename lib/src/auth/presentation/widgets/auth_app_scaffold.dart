import '../../../main_index.dart';

class AuthAppScaffold extends StatelessWidget {
  final Widget? child;
  const AuthAppScaffold(
      {Key? key, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: 240.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r))),
          child: Column(
            children: [
              0.h.ph,
              Image.asset(AppImages.logo_white, width: 280.w),
            ],
          ),
        ),
        Container(
          padding: 20.paddingHoriz + 30.paddingVert,
          // height: 480.h,
          margin: EdgeInsets.only(top: 180.h , left: 10.w , right: 10.w),
          width: 380.w,
          decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(30.r) ,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1) ,
                  blurRadius: 8 ,
                  offset: const Offset(0, 0) ,

                )
              ]
          ),
          child: child,
        )
      ],
    );
  }
}
