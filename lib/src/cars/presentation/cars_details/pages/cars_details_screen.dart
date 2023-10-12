import 'package:delala/src/home/presentation/widgets/sub_custom_container.dart';
import '../../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../widgets/car_details.dart';
import '../widgets/price_car_details.dart';
import '../widgets/sliders_car_details.dart';

class CarsDetailsScreen extends BaseStatelessWidget {
  final List<Task> tasks;

  CarsDetailsScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlidersCarDetails(
          images: ['', '', '', ''],
        ),
        Padding(
          padding: 15.paddingHoriz,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('بي ام دبليو  X6 218i X6 218i '),
              15.ph,
              Row(
                children: [
                  SubCustomContainer(
                    backgroundColor: AppColors.grey_d9,
                    label: context.strings.new_,
                    fontSize: 14,
                    labelColor: AppColors.blue_31,
                    width: 55,
                  ),
                  12.pw,
                  SubCustomContainer(
                    backgroundColor: AppColors.grey_d9,
                    label: '2023',
                    fontSize: 14,
                    labelColor: AppColors.blue_31,
                    width: 55,
                  ),
                ],
              ),
              10.ph,
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: SubCustomContainer(
                  backgroundColor: AppColors.blue_31,
                  label: context.strings.rs + ' 1,000,000',
                  fontSize: 18,
                  padding: 5.paddingVert,
                  width: 170,
                ),
              ),
            ],
          ),
        ),
        20.ph,
        Expanded(
          child: TabBarWidget(
            tabs: [
              TabItemModel(
                label: context.strings.price,
                page: 0.ph,
              ),
              TabItemModel(
                label: context.strings.details,
                  page: 0.ph,
              ),
              TabItemModel(
                label: context.strings.categories,
                page: 0.ph,
              ),
            ],
          ),
        )
      ],
    );
  }
}

// CarProperties(
//   properties: [
//     CarProperty(
//       title: 'Sedan',
//       subtitle: context.strings.body_shape,
//       icon: AppIcons.sedan_car_model,
//     ),
//     CarProperty(
//       title: 'Gas',
//       subtitle: context.strings.fuel_type,
//       icon: AppIcons.gas_station,
//     ),
//     CarProperty(
//       title: 'Automatic',
//       subtitle: context.strings.transmission,
//       icon: AppIcons.transmission,
//     ),
//     CarProperty(
//       title: '25,000 KM',
//       subtitle: context.strings.kilometers,
//       icon: AppIcons.sedan_car_model,
//     ),
//     CarProperty(
//       title: '1600 CC',
//       subtitle: context.strings.engine_capacity,
//       icon: AppIcons.sedan_car_model,
//     ),
//   ],
// ),
