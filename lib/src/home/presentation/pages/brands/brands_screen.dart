import '../../../../main_index.dart';
import 'brands_list.dart';
import '../../widgets/cars_home_list.dart';
import '../../widgets/home_sliders.dart';

class BrandsScreen extends BaseStatelessWidget {
  BrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.strings.brands,
      backgroundColor: context.scaffoldBackgroundColor,
      body: BrandsList(),
    );
  }
}
