
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../widgets/car_details.dart';
import '../widgets/car_properties.dart';
import '../widgets/price_car_details.dart';
import '../widgets/sliders_car_details.dart';

class CarsDetailsScreen extends BaseStatelessWidget {
  final List<Task> tasks;
  CarsDetailsScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 20.paddingBottom,
      child: Column(
        children: [
          SlidersCarDetails(
            images: ['','', '', ''],
          ),
          CarProperties(
            properties: [
              CarProperty(
                title: 'Sedan',
                subtitle: context.strings.body_shape,
                icon: AppIcons.sedan_car_model,
              ),
              CarProperty(
                title: 'Gas',
                subtitle: context.strings.fuel_type,
                icon: AppIcons.gas_station,
              ),
              CarProperty(
                title: 'Automatic',
                subtitle: context.strings.transmission,
                icon: AppIcons.transmission,
              ),
              CarProperty(
                title: '25,000 KM',
                subtitle: context.strings.kilometers,
                icon: AppIcons.sedan_car_model,
              ),
              CarProperty(
                title: '1600 CC',
                subtitle: context.strings.engine_capacity,
                icon: AppIcons.sedan_car_model,
              ),
            ],
          ),
          PriceCarDetails(
            price: '1,390,000',
          ),
          CarDetails(
            //tasks: tasks,
          ),
        ],
      ),
    );
  }
}
