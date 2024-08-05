import 'package:dalalah/src/main_index.dart';
import '../../../../showrooms/presentation/showrooms/widgets/showroom_item.dart';
import '../../../data/models/properties_developers.dart';
import '../widgets/properties_developer_item.dart';

class PropertiesDevelopersScreen extends BaseStatelessWidget {
 final List<PropertiesDevelopers> developers;

  PropertiesDevelopersScreen( {super.key, required this.developers, });

   @override
  Widget build(BuildContext context) {
    return ListView.builder(
     padding: 15.paddingAll,
     itemCount: developers.length,
     shrinkWrap: true,
     controller: ScrollController(),
     itemBuilder: (context, index) {
      return PropertiesDeveloperItem(
       developer: developers[index],
      );
     },
    );

   }
}
