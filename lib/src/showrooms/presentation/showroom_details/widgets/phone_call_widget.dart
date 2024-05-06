import '../../../../../core/utils/helper_methods.dart';
import '../../../../cars/presentation/cars/widgets/cars_vertical_item.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';

class PhoneCallWidget extends BaseStatelessWidget {
  final String phone;

  PhoneCallWidget({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          HelperMethods.launchCallPhone(phone);
        },
        child: Container(
          margin: 5.paddingAll,
          padding: 10.paddingAll,
          decoration: Decorations.kDecorationBorderRadius(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                phone,
                style: context.bodyMedium,
              ),
              AppIcon(
                icon: AppIcons.phone_solid,
                size: 20,
                color: context.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
