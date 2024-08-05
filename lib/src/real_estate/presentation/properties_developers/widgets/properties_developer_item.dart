import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../../core/widgets/texts/column_texts.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../showrooms/domain/entities/branch_args.dart';
import '../../../data/models/properties_developers.dart';

class PropertiesDeveloperItem extends BaseStatelessWidget {
  final PropertiesDevelopers developer;
   PropertiesDeveloperItem({super.key,required this.developer, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNamed(
          Routes.propertiesDevelopersDetailsPage,
          arguments: developer,
        );
      },
      child: CustomCompanyContainer(
        iconColor2: context.primaryColor,
        firstOnTap: () {
          HelperMethods.launchCallPhone(developer.phone ?? '');
        },
        hasOneButton: true,
        secondOnTap: () async {
          // pushNamed(
          //   Routes.branchesPage,
          //   arguments: BranchArgs(id: developer.id, role: await HelperMethods.getUserRole()),
          // );
        },
        body: Padding(
          padding: 10.paddingVert + 15.paddingHoriz,
          child: Row(
            children: [
              ImageNetwork(
                url: developer.logo ?? '',
                size: 70,
                borderWidth: 1.5,
              ),
              20.pw,
              ColumnTexts(
                crossAxisAlignment: CrossAxisAlignment.start,
                title: developer.name ?? '',
                value: developer.city?.name?.replaceAll(',', '') ?? '',
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


