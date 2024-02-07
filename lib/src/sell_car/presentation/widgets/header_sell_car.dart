import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';
import 'package:dalalah/src/main_index.dart';

class HeaderSellCar extends StatelessWidget {
  final int step;
  final BlocConsumer buildConsumer;
  const HeaderSellCar({super.key, required this.step, required this.buildConsumer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.paddingHoriz + 10.paddingBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (kTextTabBarHeight + 10).ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(),
              Text(
                '$step/4',
                style: context.displayMedium,
              ),
            ],
          ),
          15.ph,
          Text(
            context.strings.add_car,
            style: context.titleSmall,
          ),
          15.ph,
          Expanded(
            child: buildConsumer,
          ),
        ],
      ),
    );
  }
}
