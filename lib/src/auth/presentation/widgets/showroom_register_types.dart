import 'package:dalalah/core/widgets/radio/custom_radio_list_tile2.dart';

import '../../../installment/domain/entities/roles.dart';
import '../../../main_index.dart';

class ShowroomRegisterTypes extends BaseStatelessWidget {
  final Function(String)? onChange;
   ShowroomRegisterTypes({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    String type = Roles.SHOWROOM;
    return StatefulBuilder(
          builder: (context, setState) {
            return Row(
              children: [
                Expanded(
                  child: CustomRadioListTile2(
                    value: Roles.SHOWROOM,
                    title: strings.showroom,
                    groupValue: type,
                    onChanged: (value) {
                      type = value.toString();
                      onChange!(value.toString());
                      setState(() {
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomRadioListTile2(
                    value: Roles.AGENCY,
                    title: strings.agency,
                    groupValue: type,
                    onChanged: (value) {
                      type = value.toString();
                      onChange!(value.toString());
                      setState(() {
                      });
                    },
                  ),
                ),
              ],
            );
          }
      );
  }
}
