import 'package:dalalah/core/resources/data_state.dart';
import 'package:dalalah/src/real_estate/presentation/properties_developers/pages/properties_developer_details/properties_developers_details_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
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
       developerDetails:state.data!
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.real_estate_developers;
  }
}
