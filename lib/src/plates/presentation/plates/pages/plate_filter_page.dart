import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/widgets/buttons/primary_button.dart';
import 'package:delala/core/widgets/drop_down/drop_down.dart';
import 'package:delala/core/widgets/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../core/widgets/buttons/selection_button_chip.dart';
import '../widgets/filter_item.dart';

///  Created by harbey on 10/12/2023.
class PlateFilterPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool? isAddPage = getArguments(context) ?? false;
    List<DropDownItem> items = [DropDownItem()];
    List<ChipItem> types = [ChipItem(title: 'خصوصي'), ChipItem(title: 'نقل')];
    List<TextEditingController> controllersArLetters =
        List.generate(3, (index) => TextEditingController());
    List<TextEditingController> controllersEnLetters =
        List.generate(3, (index) => TextEditingController());
    List<TextEditingController> controllersNumbers =
        List.generate(4, (index) => TextEditingController());
    return AppScaffold(
      title: isAddPage ? strings.add_plate : strings.detailed_research,
      body: SingleChildScrollView(
        padding: 16.paddingAll,
        child: Column(
          children: [
            SelectionButtonChip(
              title: strings.plate_type,
              types: types,
              onSelected: (bool value) {},
            ),
            35.ph,
            Container(
              margin: 10.paddingTop,
              padding: 16.paddingVert + 10.paddingHoriz,
              // decoration: Decorations.mainShapeDecoration(),
              decoration: Decorations.kDecorationOnlyRadius(
                color: context.primaryColor,

              ),
              child: Column(
                children: [
                  DropDownField(
                    items: items,
                    marginDropDown: 8.paddingHoriz,
                    title: strings.numbers_type,
                    titleStyle: context.labelMedium,
                    hint: strings.numbers_type,
                    onChanged: (value) {},
                  ),
                  40.ph,
                  FilterItem(
                    title: strings.arabic_letters,
                    controllers: controllersArLetters,
                  ),
                  40.ph,
                  FilterItem(
                    title: strings.english_letters,
                    controllers: controllersEnLetters,
                  ),
                  40.ph,
                  FilterItem(
                    title: strings.numbers,
                    controllers: controllersNumbers,
                  ),
                  30.ph,
                ],
              ),
            ),
            40.ph,
            isAddPage
                ? PrimaryButton(
                    title: strings.save,
                    onPressed: () {},
                  )
                : PrimaryOutlinesButtons(
                    title1: strings.show_results,
                    title2: strings.cancel,
                    onPressed2: () {
                      Navigator.pop(context);
                    },
                    onPressed1: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
