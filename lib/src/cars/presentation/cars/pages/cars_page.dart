import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/widgets/filter_home.dart';
import '../bloc/cars_bloc.dart';
import '../widgets/brands_filter.dart';
import 'cars_screen.dart';

class CarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, CarsCubit> {
  final CarFilterParams? params;
  CarsPage({Key? key, this.params}) : super(key: key);


  CarFilterParams paramsFilter = CarFilterParams();
  int tabIndex = 0;
  int brandId = 0;

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchBrands();
    bloc.fetchCars(params ?? getArguments(context) ?? CarFilterParams());
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  @override
  Function()? onTabSelected(index) {
    tabIndex = index;
    bloc.fetchCars(CarFilterParams(
      status: CarStatus.getStatusByIndex(index),
    ), );
    return null;
  }
  @override
  Widget build(BuildContext context) {
    bool isNotFilter =  (params ==null || getArguments(context) == null);
    return mainFrame(
      body: Column(
        children: [
          if (isNotFilter)
        ...[  FilterHome(
            routeName: Routes.carsSearchPage,
            onFilterOrder: () {},
          ),
          10.ph,
          BrandsFilter(
            brandsStream: bloc.brandsStream,
            onFilter: (value) {
              brandId = value;
              if (value == 0) return bloc.fetchCars(CarFilterParams());
              bloc.fetchCars(CarFilterParams(brand: value, status: CarStatus.getStatusByIndex(tabIndex)));
            },
          ),],
          Expanded(child: buildConsumer(context)),
        ],
      ),
      // body: buildConsumer(context),
      tabs: [
        TabModel(label: context.strings.all),
        TabModel(label: context.strings.new_),
        TabModel(label: context.strings.used),
      ],
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return CarsScreen(
      isFilter: false,
      isNew: tabIndex == 1 || tabIndex == 0 ? true : false,
      tasks: state.data ?? [],
        onToggleFavorite: (id) {
          bloc.toggleFavorite(id);
        },
    );
    // return 0.ph;
  }

  @override
  String? title(BuildContext context) {
    bool isNotFilter =  (params ==null || getArguments(context) == null);
    return  isNotFilter ? context.strings.cars : null;
  }

  @override
  onAddButtonPressed() {
    HelperMethods.isAuth().then((value) {
      if(value == true) {
        pushNamed(Routes.sellCarPage, arguments: true);
      } else {
        DialogsManager.showInfoDialogToLogin();
      }
    });
    return null;
  }


  @override
  bool isAddButton() {
    return true;
  }

  @override
  onClickReload() {
    bloc.fetchCars(CarFilterParams(
      status: CarStatus.getStatusByIndex(tabIndex),
      brand: brandId,
    ));
  }
}

class CarsPageArgs {
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID});
}
