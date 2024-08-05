import 'package:dalalah/core/resources/data_state.dart';
import 'package:dalalah/src/real_estate/presentation/properties_developers/pages/properties_developer_details/properties_developers_details_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../favorites_and_ads/presentation/my_ads/bloc/my_real_estate_bloc.dart';
import '../../../../data/models/my_properties_response.dart';
import '../../bloc/properties_developers_bloc.dart';

class PropertiesDevelopersDetailsPage extends BaseBlocWidget< DataSuccess<List<Property>>,MyRealEstateCubit> {
  PropertiesDevelopersDetailsPage({Key? key}) : super(key: key);
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyRealEstates();
  }
  @override
  Widget buildWidget(BuildContext context,  DataSuccess<List<Property>> state) {
   return PropertiesDevelopersDetailsScreen(
     developer: getArguments(context), properties: state.data!,);
  }

  @override
  String? title(BuildContext context) {
    return strings.real_estate_developers;
  }
}
