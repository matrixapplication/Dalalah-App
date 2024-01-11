import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/list-tile/custom_list_tile.dart';
import 'package:dalalah/core/widgets/list-tile/custom_list_tile2.dart';
import 'package:dalalah/core/widgets/texts/row_texts.dart';

import '../../../main_index.dart';
import '../../domain/entities/contact_us.dart';

class ContactUsWidget extends BaseStatelessWidget {
  final ContactUs? contactUs;
  ContactUsWidget({super.key, this.contactUs});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomListTile2(
            backgroundColor: context.dividerColor,
            title: contactUs?.phone ?? '',
            iconLeading: AppIcons.phone,
            isArrowForward: true,
            onTap: () {
              HelperMethods.launchCallPhone(contactUs?.phone ?? '');
            },
          ),

          10.ph,
          CustomListTile2(
            backgroundColor: context.dividerColor,
            title: contactUs?.email ?? '',
            iconLeading: AppIcons.email,
            isArrowForward: true,
            onTap: () {
              HelperMethods.launchEmail(contactUs?.email ?? '');
            },
          ),
          10.ph,
          RowTexts(
            title: strings.address,
            value: contactUs?.address ?? '',
          ),
        ],
      ),
    );
  }
}
