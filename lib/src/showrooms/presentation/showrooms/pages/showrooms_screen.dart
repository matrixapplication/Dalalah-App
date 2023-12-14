import '../../../../main_index.dart';

import '../widgets/showroom_item.dart';

class ShowroomsScreen extends BaseStatelessWidget {
  ShowroomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: 8,
      itemBuilder: (context, index) {
        return ExhibitionItem();
      },
    );
  }
}
