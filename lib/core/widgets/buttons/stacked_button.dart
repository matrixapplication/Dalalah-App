
import 'package:dalalah/src/main_index.dart';


class StackedButton extends BaseStatelessWidget {
  final String titleButton;
  final Widget? footerChild;
  final Widget child;
  final Function()? onPressed;

  StackedButton(
      {super.key,  required this.titleButton,  this.footerChild, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              margin: 150.paddingBottom,
              alignment: Alignment.topCenter,
              child: child),
          Container(
            height: 150,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F6),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.shadow.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: 20.paddingAll,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(footerChild != null) footerChild!,
                  PrimaryButton(
                    title: titleButton.toUpperCase(),
                    height: 65,
                    // margin: 20.paddingVert,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
