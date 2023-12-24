import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/showroom.dart';

class ShowroomItem extends BaseStatelessWidget {
  final Showroom showroom;
  ShowroomItem({super.key, required this.showroom});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigators.pushNamed(
          Routes.exhibitionDetailsPage,
          arguments: showroom,
        );
      },
      child: CustomCompanyContainer(
          iconColor2: context.primaryColor,
        firstOnTap: () {
          HelperMethods.launchCallPhone(showroom.phone ?? '');
        },
        secondOnTap: () {
          pushNamed(
            Routes.branchesPage,
            arguments: showroom.id,
          );
        },
        body: Padding(
          padding: 10.paddingVert + 15.paddingHoriz,
          child: Row(
            children: [
              ImageNetwork(
                url: showroom.image ?? '',
                size: 70,
                borderWidth: 1.5,
              ),
              20.pw,
              ColumnTexts(
                crossAxisAlignment: CrossAxisAlignment.start,
                title: showroom.showroomName ?? '',
                value: showroom.address ?? '',
                titleStyle: context.textTheme.bodyMedium,
                valueStyle: context.textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
