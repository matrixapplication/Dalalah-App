import 'package:arabitac/src/main_index.dart';


Future customBottomSheet(
  context, {
  Color? sheetColor,
  EdgeInsetsGeometry? sheetPadding,
  BorderRadiusGeometry? sheetBorderRadius,
  required Widget sheetChild,
  bool isScanButton = false,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: sheetPadding ??
          const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
          color: sheetColor ?? AppColors.appBackgroundColor,
          borderRadius: sheetBorderRadius ??
              const BorderRadius.vertical(top: Radius.circular(20)),),
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return (isScanButton)
              ? sheetChild
              : Column(
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.appIconLightGreyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          sheetChild,
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    ),
  );
}
