import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/resources/data_state.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/src/real_estate/data/models/add_rate_developer_params.dart';
import 'package:dalalah/src/real_estate/presentation/properties_developers/pages/properties_developer_details/properties_developers_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/buttons/row_buttons.dart';
import '../../../../../../core/widgets/rating/custom_rating_bar.dart';
import '../../../../../showrooms/data/models/add_rate_params.dart';
import '../../../../data/models/properties_developer_details.dart';
import '../../bloc/properties_developers_bloc.dart';

class PropertiesDevelopersDetailsPage extends BaseBlocWidget< DataSuccess<PropertiesDeveloperDetails>,PropertiesDevelopersPageCubit> {
  PropertiesDevelopersDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchPropertiesDevelopersDetails( getArguments(context));
  }

  @override
  Widget buildWidget(BuildContext context,  DataSuccess<PropertiesDeveloperDetails> state) {
   return PropertiesDevelopersDetailsScreen(
       developerDetails:state.data!,
     onAddRate: () {
       showAddRateDialog(state.data?.id ?? 0);
     },
     onFollow: () {
        bloc.addFollowDeveloper(state.data?.id ?? 0);
     },
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.real_estate_developers;
  }
  @override
  void onSuccessDismissed() {
    loadInitialData(context!);
  }

  showAddRateDialog(int id) async {
    double rate = 3;
    bool isUser = await HelperMethods.isUser();
    if (isUser) {
      showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          titlePadding: 10.paddingAll,
          title: Text(
            strings.showroom_evaluation,
            style: context.bodyMedium.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRatingBar(
                initialRating: rate,
                itemSize: 35,
                icon: AppIcons.rate_star,
                iconColor: context.yellow_03,
                ignoreGestures: false,
                padding: 2.paddingAll,
                onRating: (value) {
                  rate = value;
                },
              ),
            ],
          ),
          actions: [

            RowButtons(
              title1: strings.add,
              title2: strings.cancel,
              onPressed1: () {
                Navigator.pop(context);
                bloc.addRateDeveloper(AddRateDeveloperParams(
                  rate: rate.toInt(),
                  propDeveloperId: id,
                ));
              },
              onPressed2: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }
}
