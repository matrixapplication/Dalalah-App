
import 'package:arabitac/core/utils/helper_methods.dart';

import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../../core/widgets/buttons/primary_icon_button.dart';
import '../../../../../core/widgets/chip/chip_border.dart';
import '../../../../../core/widgets/chip/price_widget.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../../core/widgets/list-tile/custom_list_tile2.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';


class CarHorizItem extends StatelessWidget {
  final Task task;
  const CarHorizItem( {Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10),
      decoration: Decorations.shapeBottomShadow(
          color: context.scaffoldBackgroundColor, colorShadow: context.disabledColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: Decorations.kDecorationLiftRadius(color: context.cardColor),
              child: const ImageNetwork(
                image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
                height: 140,
                  radius: 0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BMW X6 218i X6 218i 2022",
                    style: context.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ChipBorder(
                          margin: 10.paddingStart,
                          label: '2023',
                        ),
                      ),
                    //  10.pw,
                      Expanded(
                        child: ChipBorder(
                          margin: 10.paddingStart,
                          label: '140.000 km',
                        ),
                      ),
                    ],
                  ),
                  12.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriceWidget(
                        price: "850,000",
                        backgroundColor: context.primaryColor,
                      ),
                      AppCircularIconButton(
                        size: 18,
                        icon: AppIcons.heart,
                        color: context.errorColor,
                        backgroundColor: context.cardColor,
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
