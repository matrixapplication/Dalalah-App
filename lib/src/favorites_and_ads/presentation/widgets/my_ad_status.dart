import 'package:dalalah/src/main_index.dart';

import 'chip_ad.dart';

class MyAdStatus extends BaseStatelessWidget {
  final bool isSold;
  final bool isHidden;
  final bool isApproved;
  final bool isHiddenByAdmin;
   MyAdStatus({super.key, required this.isSold, required this.isHidden, required this.isApproved, required this.isHiddenByAdmin});

  @override
  Widget build(BuildContext context) {
    print("isSold $isSold");
    return    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if(isHiddenByAdmin)
            ChipAd(
              text: strings.hidden_by_admin,
            ),
          if(isHidden)
            ChipAd(
              text: strings.hidden,
            ),
           if(isSold)
          ChipAd(
            text: strings.sold ?? "",
          ),
          if(!isApproved)
          ChipAd(
            text: strings.pending ?? "",
          ),
        ],
      ),
    );
  }
}
