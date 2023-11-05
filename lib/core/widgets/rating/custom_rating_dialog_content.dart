

import '../../../src/main_index.dart';
import '../buttons/outlined_button.dart';
import '../text-field/custom_text_field.dart';
import 'custom_rating_bar.dart';

class CustomRatingDialogContent extends StatelessWidget {
  const CustomRatingDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return SizedBox(
      width: context.width,
      height: 300,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: 20.paddingTop + 20.paddingHoriz,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.strings.rate_the_car,
                  style: context.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.ph,
                CustomRatingBar(
                  initialRating: 0,
                  itemSize: 40,
                  ignoreGestures: false,
                  padding: 2.paddingAll,
                  onRating: (value) {},
                ),
                30.ph,
                CustomTextField(
                  radius: 15,
                  fillColor: context.dividerColor,
                  controller: commentController,
                  maxLines: 3,
                  hintText: context.strings.enter_your_comment,
                ),
                20.ph,
                PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: context.strings.save,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: CloseButton()),
        ],
      ),
    );
  }
}
