import 'package:delala/src/main_index.dart';

import '../../utils/icons.dart';

Widget customTextField({
  required TextEditingController textEditingController,
  required String hintText,
  required String? iconPath,
  bool isPasswordField = false,
  bool isPhoneField = false,
  bool isEmailField = false,
}) {
  bool showPasswordField = isPasswordField;
  String passIcon = IconPaths.eyeSlash;
  return Container(
    height: 50,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.appTextFieldBackgroundColor,
      border: Border.all(
        color: AppColors.appTextFieldBorderColor,
      ),
    ),
    child: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                cursorColor: AppColors.appTextFieldIconColor,
                obscureText: showPasswordField,
                keyboardType: (isPhoneField)
                    ? TextInputType.phone
                    : (isEmailField)
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                style: TextStyle(
                  color: AppColors.appTextFieldTextColor,
                  fontSize: AppFonts.myP1,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.appTextFieldHintColor,
                    fontSize: AppFonts.myH7,
                  ),
                  icon: (iconPath != null)?SvgPicture.asset(
                    iconPath,
                    color: AppColors.appTextFieldIconColor,
                  ): null,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            if (isPasswordField)
              GestureDetector(
                onTap: () {
                  print("object");
                  setState(() {
                    (passIcon == IconPaths.eye)
                        ? passIcon = IconPaths.eyeSlash
                        : passIcon = IconPaths.eye;
                    showPasswordField = !showPasswordField;
                  });
                },
                child: SvgPicture.asset(
                  passIcon,
                  color: AppColors.appTextFieldIconColor,
                ),
              ),
          ],
        );
      },
    ),
  );
}
/*

class CustomTextField extends StatefulWidget {
  bool isPasswordField;
  bool isPhoneField;
  bool isEmailField;
  final String hintText, iconPath;
  final TextEditingController textEditingController;

  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.iconPath,
    this.isPasswordField = false,
    this.isPhoneField = false,
    this.isEmailField = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPasswordField = false;
  String passIcon = IconPaths.eyeSlash;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showPasswordField = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.appTextFieldBackgroundColor,
        border: Border.all(
          color: AppColors.appTextFieldBorderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 285,
            child: TextField(
              controller: widget.textEditingController,
              cursorColor: AppColors.appTextFieldIconColor,
              obscureText: showPasswordField,
              keyboardType: (widget.isPhoneField)
                  ? TextInputType.phone
                  : (widget.isEmailField)
                      ? TextInputType.emailAddress
                      : TextInputType.text,
              style: TextStyle(
                color: AppColors.appTextFieldTextColor,
                fontSize: AppFonts.myP1,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.appTextFieldHintColor,
                  fontSize: AppFonts.myH7,
                ),
                icon: SvgPicture.asset(
                  widget.iconPath,
                  color: AppColors.appTextFieldIconColor,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          if (widget.isPasswordField)
            GestureDetector(
              onTap: () {
                print("object");
                setState(() {
                  (passIcon == IconPaths.eye)
                      ? passIcon = IconPaths.eyeSlash
                      : passIcon = IconPaths.eye;
                  showPasswordField = !showPasswordField;
                });
              },
              child: SvgPicture.asset(
                passIcon,
                color: AppColors.appTextFieldIconColor,
              ),
            ),
        ],
      ),
    );
  }
}
*/
