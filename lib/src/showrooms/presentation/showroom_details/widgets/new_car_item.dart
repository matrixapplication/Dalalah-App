import '../../../../cars/presentation/cars/widgets/cars_vertical_item.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';

class NewCarItem extends BaseStatelessWidget {
  final Car car;
  final Function(int)? onRequestPrice;
  final Function(int)? onToggleFavorite;

  NewCarItem({super.key, required this.car, this.onRequestPrice, this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 15.paddingBottom,
      width: double.infinity,
      decoration: Decorations.kDecorationBoxShadow(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: CarVerticalItem(
              bottomMargin: 0,
              imageHasOnlyTopRadius: true,
              car: car,
              onToggleFavorite: onToggleFavorite,
            ),
          ),
          GestureDetector(
            onTap: () => onRequestPrice?.call(car.id ?? 0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: 6.paddingVert,
              decoration: Decorations.kDecorationBorderRadius(
                  color: AppColors.yellow_15,
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(5),
                    bottomEnd: Radius.circular(5),
                  )),
              child: Text(
                strings.request_for_quotation,
                style: context.textTheme.labelLarge!
                    .copyWith(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
