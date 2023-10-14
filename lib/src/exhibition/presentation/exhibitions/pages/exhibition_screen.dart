import '../../../../main_index.dart';

import '../widgets/exhibition_item.dart';

class ExhibitionScreen extends BaseStatelessWidget {
  ExhibitionScreen({super.key});

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
