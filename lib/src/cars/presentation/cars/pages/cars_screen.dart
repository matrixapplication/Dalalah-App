
import 'package:delala/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/widgets/text-field/custom_text_field_dark.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../widgets/brands_filter.dart';
import '../widgets/cars_horiz_item.dart';

class CarsScreen extends BaseStatelessWidget {
  final bool isFilter;
  final List<Task> tasks;
   CarsScreen({Key? key, required this.tasks, required this.isFilter}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(isFilter)
        ...[
          //FilterHome(isDecoration: false),
        BrandsFilter(
         items: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15].map((e) => e.toString()).toList(),
          onFilter: (value) {},
        )],
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return  CarHorizItem(task: tasks[index]);
            },
          ),
        ),
      ],
    );
  }
}
