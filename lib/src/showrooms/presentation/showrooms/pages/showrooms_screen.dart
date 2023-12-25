import '../../../../main_index.dart';

import '../../../domain/entities/showroom.dart';
import '../widgets/showroom_item.dart';

class ShowroomsScreen extends BaseStatelessWidget {
  final List<Showroom> showrooms;
  final bool? isAgency;
  ShowroomsScreen({super.key, required this.showrooms, this.isAgency});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: showrooms.length,
      shrinkWrap: true,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        showrooms[index].isAgency = isAgency ?? false;
        return ShowroomItem(
          showroom: showrooms[index],
        );
      },
    );
  }
}
