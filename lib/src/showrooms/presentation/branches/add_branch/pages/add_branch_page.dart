import 'package:dalalah/src/cars/data/models/comment_dto.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/showrooms/domain/entities/branch.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../bloc/add_branch_bloc.dart';
import 'add_branch_screen.dart';

class AddBranchPage extends BaseBlocWidget<DataSuccess<List<City>>, AddBranchCubit> {
  AddBranchPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    return AddBranchesScreen(
      initialBranch: getArguments(context),
      cities: state.data ?? [],
      districtsStream: bloc.districtsStream,
        onFetchDistricts: (id){
          bloc.fetchDistricts(id);
        },
      onAddBranch: (params) {
        bloc.addBranch(params);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    Branch? branch = getArguments(context);
    return (branch != null) ? strings.edit_branch : strings.add_branch;
  }
}
