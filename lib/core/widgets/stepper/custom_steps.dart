import 'package:easy_stepper/easy_stepper.dart';

import '../../../src/main_index.dart';

///  Created by harby on 9/27/2023.
class CustomSteps extends StatelessWidget {
  final List<String> steps;
  final int activeStep;
  final List<Widget> children;
  final PageController? controller;
  const CustomSteps({
    Key? key,
    required this.steps,
    required this.activeStep,
    required this.children,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int activeStep = this.activeStep;
    PageController controller = this.controller ?? PageController(initialPage: activeStep);
    return Row(
      children: [
        SingleChildScrollView(
          child: StatefulBuilder(builder: (context, setState) {
            return EasyStepper(
                activeStep: activeStep,
                lineStyle: const LineStyle(
                  lineLength: 76,
                  activeLineColor: Color(0xFFA1A1A1),
                  finishedLineColor: Color(0xFFA1A1A1),
                  defaultLineColor: Color(0xFFA1A1A1),
                  lineType: LineType.normal,
                ),
                activeStepBorderType: BorderType.normal,
                stepRadius: 16,
                showStepBorder: false,
                internalPadding: 20,
                activeStepBackgroundColor: context.primaryColor,
                finishedStepBackgroundColor: context.primaryColor,
                unreachedStepBackgroundColor: Color(0xFFF2F6F7),
                activeStepTextColor: context.primaryColor,
                finishedStepTextColor: context.primaryColor.withOpacity(0.5),
                // activeStepIconColor: Colors.white,
                // unreachedStepIconColor: Colors.black87,
                // unreachedStepBorderColor: Colors.black54,
                // unreachedStepTextColor: Colors.black,
                showLoadingAnimation: false,
                direction: Axis.vertical,
                steps: steps
                    .map((e) => EasyStep(
                          customTitle: Text(
                            e,
                            style: context.bodyMedium.copyWith(fontSize: 16, color: activeStep >= steps.indexOf(e) ? context.primaryColorDark : const Color(0xffA1A1A1)),
                            textAlign: TextAlign.center,
                          ),
                          customStep: const SizedBox.shrink(),
                        ))
                    .toList(),
                onStepReached: (index) {
                  setState(() => activeStep = index);
                  controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                });
          }),
        ),
       Column(
         children: children,
       )
      ],
    );
  }
}
