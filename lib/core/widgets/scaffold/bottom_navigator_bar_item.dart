import 'package:dalalah/src/main_index.dart';

import '../../utils/icons.dart';


Widget bottomNavigatorBarItem({
  required String itemIcon,
  String itemLabel = "noLabel",
  Color? itemColor,
}) {
  double containerWidth = 65;
  return SizedBox(
    height: containerWidth,
    child: (itemIcon == IconPaths.directArrow || itemIcon == IconPaths.directArrowOutline)
        ? Container(
            width: containerWidth,
            height: containerWidth,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: itemColor ?? AppColors.appIconLightGreyColor, width: 2,),
              borderRadius: BorderRadius.circular(containerWidth),
            ),
            child: SvgPicture.asset(itemIcon, color: itemColor ?? AppColors.appIconLightGreyColor,),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                itemIcon,
                color: itemColor ?? AppColors.appIconLightGreyColor,
              ),
              if (itemLabel != "noLabel")
                Text(
                  itemLabel,
                  style: TextStyle(
                      color: itemColor ?? AppColors.appIconLightGreyColor,
                      fontSize: AppFonts.myP3),
                ),
            ],
          ),
  );
}
