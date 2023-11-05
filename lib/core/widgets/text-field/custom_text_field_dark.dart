
import 'custom_text_field.dart';
import 'package:dalalah/src/main_index.dart';


class CustomTextFieldDarkSearch extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const CustomTextFieldDarkSearch({Key? key, this.controller, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: theme.primaryColor,
        child: CustomTextField(
          hintText: hintText,
          controller: controller,
          onChanged: (value) {},
          fillColor: const Color(0xFF232323),
          colorBorderSide: kDividerColor2,
          textAlign: TextAlign.center,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(12),
            child: AppIcon(icon: AppIcons.search, color: kGrayColor2),
          ),
        )
    );
  }
}
