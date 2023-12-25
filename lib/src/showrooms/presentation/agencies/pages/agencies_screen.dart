
import '../../../../main_index.dart';

import '../../../domain/entities/agency.dart';
import '../../../domain/entities/showroom.dart';
import '../../showrooms/widgets/showroom_item.dart';

class AgenciesScreen extends BaseStatelessWidget {
  final List<Agency> branches;
  AgenciesScreen({super.key, required this.branches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: branches.length,
      itemBuilder: (context, index) {
        return ShowroomItem(
          showroom: Showroom(
            id: branches[index].id,
            showroomName: branches[index].showroomName,
            address: branches[index].address,
            phone: branches[index].phone,
            image: branches[index].image,
          )
        );
      },
    );
  }
}
