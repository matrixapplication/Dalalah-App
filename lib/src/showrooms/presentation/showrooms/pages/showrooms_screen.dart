import '../../../../main_index.dart';

import '../../../domain/entities/showroom.dart';
import '../widgets/showroom_item.dart';

class ShowroomsScreen extends BaseStatelessWidget {
  final List<Showroom> showrooms;
  ShowroomsScreen({super.key, required this.showrooms});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: showrooms.length,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return ShowroomItem(
          showroom: showrooms[index],
        );
      },
    );
  }
}
