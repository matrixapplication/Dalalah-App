import 'package:dalalah/core/widgets/buttons/row_buttons.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';
import '../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../core/widgets/radio/custom_radio_list_tile2.dart';
import '../../../main_index.dart';
import '../widgets/installment_step_tile.dart';
import '../widgets/installment_value.dart';

class InstallmentScreen extends BaseStatelessWidget {
  final StreamStateInitial<String?> installmentValueStream;
  final Function(String) onFetchInstallmentValue;

  InstallmentScreen(
      {super.key,
      required this.installmentValueStream,
      required this.onFetchInstallmentValue});

  @override
  Widget build(BuildContext context) {
    TextEditingController totalSalaryController = TextEditingController();
    TextEditingController creditLimitController = TextEditingController();
    TextEditingController personalFinanceAcceptController = TextEditingController();
    TextEditingController mortgageAcceptController = TextEditingController();
    StreamStateInitial<bool> personalFinanceAcceptStream = StreamStateInitial<bool>();
    StreamStateInitial<bool> mortgageAcceptStream = StreamStateInitial<bool>();

    bool isExist = true;

    List<DropDownItem> items = [
      DropDownItem(
        title: "حكومي",
        value: '1',
      ),
      DropDownItem(
        title: "خاص",
        value: '2',
      ),
    ];

    return SingleChildScrollView(
      padding: 16.paddingHoriz + 25.paddingVert,
      child: Container(
        padding: 15.paddingAll,
        decoration: Decorations.kDecorationBorder(
          borderColor: context.colorScheme.outline,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings
                  .calculate_the_monthly_installment_and_installment_period_or_determine_your_budget,
              style: context.bodyMedium,
            ),
            30.ph,
            InstallmentStepTile(
              stepNumber: 1,
              title: strings.total_salary,
              child: CustomTextField(
                controller: totalSalaryController,
                hintText: strings.enter_the_value_in_saudi_riyals,
              ),
            ),
            InstallmentStepTile(
              stepNumber: 2,
              title: strings.select_employer,
              child: DropDownField(
                hint: strings.employer,
                items: items,
                height: 55,
                onChanged: (value) {},
              ),
            ),
            InstallmentStepTile(
              stepNumber: 3,
              title: strings.personal_finance,
              spaceBetweenTitleAndChild: 25,
              child: Column(
                children: [
                  CustomChooseWidget(
                    onTap: (value) {
                      personalFinanceAcceptStream.setData(value);
                    },
                    items: [
                      ChooseItemModel(
                        label: strings.exist,
                        value: true,
                      ),
                      ChooseItemModel(
                        label: strings.not_exist,
                        value: false,
                      ),
                    ],
                  ),
                  12.ph,
                  StreamBuilder<bool>(
                    initialData: true,
                    stream: personalFinanceAcceptStream.stream,
                    builder: (context, snapshot) {
                      return snapshot.data! ?
                        CustomTextField(
                        controller: personalFinanceAcceptController,
                        hintText: strings.enter_the_value_in_saudi_riyals,
                          padding: 15.paddingBottom,
                      ) : 0.ph;
                    }
                  ),
                ],
              ),
            ),
            InstallmentStepTile(
              stepNumber: 4,
              title: strings.mortgage,
              spaceBetweenTitleAndChild: 25,
              child: Column(
                children: [
                  CustomChooseWidget(
                    onTap: (value) {
                      mortgageAcceptStream.setData(value);
                    },
                    items: [
                      ChooseItemModel(
                        label: strings.exist,
                        value: true,
                      ),
                      ChooseItemModel(
                        label: strings.not_exist,
                        value: false,
                      ),
                    ],
                  ),
                  12.ph,
                  StreamBuilder<bool>(
                      initialData: true,
                      stream: mortgageAcceptStream.stream,
                      builder: (context, snapshot) {
                        return snapshot.data! ?
                        CustomTextField(
                          controller: mortgageAcceptController,
                          padding: 15.paddingBottom,
                          hintText: strings.enter_the_value_in_saudi_riyals,
                        ) : 0.ph;
                      }
                  ),
                ],
              ),
            ),
            StatefulBuilder(builder: (context, setState) {
              return InstallmentStepTile(
                  stepNumber: 5,
                  dottedLineHeight: isExist ? 16 : 10,
                  title: strings.credit_card,
                  child: Column(
                    children: [
                      CustomRadioListTile2(
                        title: strings.exist,
                        groupValue: isExist,
                        value: true,
                        onChanged: (value) {
                          isExist = value;
                          setState(() {});
                        },
                      ),
                      isExist
                          ? CustomTextField(
                              hintText: strings.enter_credit_limit,
                              controller: creditLimitController,
                            )
                          : 0.ph,
                      CustomRadioListTile2(
                        title: strings.not_exist,
                        groupValue: isExist,
                        value: false,
                        onChanged: (value) {
                          isExist = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ));
            }),
            40.ph,
            StreamBuilder<String?>(
                stream: installmentValueStream.stream,
                initialData: '',
                builder: (context, snapshot) {
                  return snapshot.data!.isNullOrEmpty()
                      ? 0.ph
                      : InstallmentValue(
                          installmentValue: snapshot.data ?? '',
                        );
                }),
            30.ph,
            StreamBuilder<String?>(
                stream: installmentValueStream.stream,
                initialData: '',
                builder: (context, snapshot) {
                  return PrimaryOutlinesButtons(
                    title1: snapshot.data!.isNullOrEmpty()
                        ? strings.calculate_your_installment
                        : strings.see_available_cars,
                    title2: strings.remove_filters,
                    onPressed1: () {
                      if (snapshot.data!.isNullOrEmpty()) {
                        onFetchInstallmentValue(totalSalaryController.text);
                      } else {
                        Navigator.pushNamed(
                            context, Routes.monthlyInstallmentPage);
                      }
                    },
                    onPressed2: () {
                      totalSalaryController.clear();
                      creditLimitController.clear();
                      installmentValueStream.setData('');
                    },
                  );
                }),
            20.ph,
          ],
        ),
      ),
    );
  }
}

//
// enum StepEnabling { sequential, individual }

// CustomSteps(
// activeStep: activeStep,
// steps: [
// 'Step 1',
// 'Step 2',
// 'Step 3',
// ],
// controller: PageController(initialPage: activeStep),
// children: [
// // Container(color: Colors.red),
// // Container(color: Colors.green),
// // Container(color: Colors.green),
// ],
// ),

//   bool _allowTabStepping(int index, StepEnabling enabling) {
//     return enabling == StepEnabling.sequential
//         ? index <= reachedStep
//         : reachedSteps.contains(index);
//   }
//
//   /// Returns the next button.
//   Widget _nextStep(StepEnabling enabling) {
//     return IconButton(
//       onPressed: () {
//         if (activeStep2 < upperBound) {
//           setState(() {
//             if (enabling == StepEnabling.sequential) {
//               ++activeStep2;
//               if (reachedStep < activeStep2) {
//                 reachedStep = activeStep2;
//               }
//             } else {
//               activeStep2 =
//                   reachedSteps.firstWhere((element) => element > activeStep2);
//             }
//           });
//         }
//       },
//       icon: const Icon(Icons.arrow_forward_ios),
//     );
//   }
//
//   /// Returns the previous button.
//   Widget _previousStep(StepEnabling enabling) {
//     return IconButton(
//       onPressed: () {
//         if (activeStep2 > 0) {
//           setState(() => enabling == StepEnabling.sequential
//               ? --activeStep2
//               : activeStep2 =
//                   reachedSteps.lastWhere((element) => element < activeStep2));
//         }
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//     );
//   }

// int activeStep = 0;
// int activeStep2 = 0;
// int reachedStep = 0;
// int upperBound = 5;
// double progress = 0.2;
// Set<int> reachedSteps = <int>{0, 2, 4, 5};
// final dashImages = [
//   'assets/1.png',
//   'assets/2.png',
//   'assets/3.png',
//   'assets/4.png',
//   'assets/5.png',
// ];

// void increaseProgress() {
//   if (progress < 1) {
//     setState(() => progress += 0.2);
//   } else {
//     setState(() => progress = 0);
//   }
// }
