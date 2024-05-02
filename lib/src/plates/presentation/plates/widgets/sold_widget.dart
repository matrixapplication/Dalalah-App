import '../../../../main_index.dart';

class SoldWidget extends BaseStatelessWidget {
  SoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 0,
      end: 0,
      child: Container(
        padding: 5.paddingVert + 10.paddingHoriz,
        decoration: BoxDecoration(
          color: context.errorColor,
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(5),
            bottomStart: Radius.circular(5),
          ),
        ),
        child: Text(context.strings.sold, style: context.labelSmall),
      ),
    );
  }
}
