
import 'package:dalalah/src/main_index.dart';
import '../../../../../core/widgets/texts/row_texts.dart';

///  Created by harby on 10/24/2023.
class DatesCreateWidget extends BaseStatelessWidget {
  final String createdDate;
  final String updatedDate;
  DatesCreateWidget({required this.createdDate, required this.updatedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.paddingAll,
      margin: 10.paddingTop,
      decoration: Decorations.kDecorationBorderRadius(
        colorBorder: context.dividerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTexts(
            title: strings.created_at,
            value: createdDate,
            titleStyle: context.bodySmall,
            valueStyle: context.headlineSmall,
          ),
          10.ph,
          RowTexts(
            title: strings.updated_at,
            value: updatedDate,
            titleStyle: context.bodySmall,
            valueStyle: context.headlineSmall,
          ),
        ],
      ),
    );
  }
}
