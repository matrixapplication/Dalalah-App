import 'package:dalalah/src/main_index.dart';

import 'chip_ad.dart';

class MyAdStatus extends BaseStatelessWidget {
  final bool isSold;
  final bool isHidden;
  final bool isApproved;
   MyAdStatus({super.key, required this.isSold, required this.isHidden, required this.isApproved});

  @override
  Widget build(BuildContext context) {
    print("isSold $isSold");
    return    Wrap(
      children: [
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
    );
  }
}
