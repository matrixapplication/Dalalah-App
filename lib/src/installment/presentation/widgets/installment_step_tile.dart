import '../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../main_index.dart';

class InstallmentStepTile extends BaseStatelessWidget {
  final int stepNumber;
  final String title;
  final Widget child;
  final int dottedLineHeight;
  final double spaceBetweenTitleAndChild;

  InstallmentStepTile({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.child,
    this.dottedLineHeight = 8,
    this.spaceBetweenTitleAndChild = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.paddingBottom,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStep(
            stepNumber: stepNumber,
            dottedLineHeight: dottedLineHeight,
          ),
          15.pw,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: 5.paddingStart,
                  child: Text(title),
                ),
                spaceBetweenTitleAndChild.ph,
                child,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomStep extends StatelessWidget {
  final int stepNumber;
  final int dottedLineHeight;

  const CustomStep({
    super.key,
    required this.stepNumber,
    this.dottedLineHeight = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: context.primaryColor,
          child: Text(
            '$stepNumber',
            style: context.labelSmall,
          ),
        ),
       9.ph,
        ...List.generate(
          dottedLineHeight,
          (index) {
            return Container(
              width: 2,
              height: 5,
              margin: 4.paddingBottom,
              color: context.primaryColor,
            );
          },
        )
      ],
    );
  }
}
