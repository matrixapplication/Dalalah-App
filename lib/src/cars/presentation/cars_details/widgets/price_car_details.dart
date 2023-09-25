import 'package:arabitac/core/widgets/chip/price_widget.dart';
import 'package:arabitac/core/widgets/texts/row_texts.dart';
import 'package:arabitac/src/main_index.dart';

import 'border_widget.dart';

///  Created by harbey on 9/6/2023.
class PriceCarDetails extends StatelessWidget {
  final String price;

  const PriceCarDetails({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderWidget(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      title: context.strings.price,
      child: Column(
        children: [
          RowTexts(
            title: context.strings.price,
            value: '36,500.00',
          ),
          CustomDivider(),
          RowTexts(
            title: context.strings.shipping,
            value: '18,000',
          ),
          CustomDivider(),
          RowTexts(
            title: '${context.strings.customs}\t\t\t38%',
            value: '36,500.00',
          ),
          20.ph,
          Container(
            padding: 2.paddingVert + 16.paddingHoriz,
            margin: 6.paddingBottom,
            decoration: Decorations.kDecorationRadius(
              color: context.primaryColor,
              radius: 8.r,
            ),
            child: RowTexts(
              title: context.strings.total_price,
              value: '36,500.00',
              titleStyle: context.labelLarge.copyWith(
                color: Colors.white,
              ),
              valueWidget: PriceWidget(
                price: '36,500.00',
                backgroundColor: context.primaryColor,
                // style: context.labelLarge.copyWith(
                //   color: Colors.white,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
