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
import '../widgets/brand_models_filter.dart';
import '../widgets/brands_filter.dart';
import 'cars_screen.dart';

class CarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, CarsCubit> {
  final bool isDetailsPage;
  final CarFilterParams? params;
  CarsPage({Key? key, this.params, this.isDetailsPage = false}) : super(key: key);


  CarFilterParams paramsFilter = CarFilterParams();
  int tabIndex = 0;
  int brandId = 0;
  int brandModelId = 0;
  String order = FilterOrderTypes.asc;


  bool isFilter =  true;
  @override
  void loadInitialData(BuildContext context) {
    isFilter =  (params == null && getArguments(context) == null);
    isFilter ? bloc.fetchBrands() : null;
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
     isFilter =  (params == null && getArguments(context) == null);
    return mainFrame(
      body: Column(
        children: [
          if (isFilter)
        ...[  FilterHome(
            routeName: Routes.carsSearchPage,
            onFilterOrder: (filterOrder) {
              order = filterOrder;

              bloc.fetchCars(CarFilterParams(
                status: CarStatus.getStatusByIndex(tabIndex),
                brand: brandId,
                order: order,
              ));
            },
          ),
          10.ph,
          BrandsFilterStream(
            brandsStream: bloc.brandsStream,
            onFilter: (value) {
              brandId = value;
              if (value == 0) return bloc.fetchCars(CarFilterParams());
              bloc.fetchCars(CarFilterParams(brand: value, order: order, status: CarStatus.getStatusByIndex(tabIndex)));
              bloc.fetchBrandModels(value);
              },
          ),
          BrandModelsFilterStream(
            brandModelsStream: bloc.brandModelsStream,
            onFilter: (value) {
              brandModelId = value;
              bloc.fetchCars(CarFilterParams(carModel: brandModelId,brand: brandId, order: order, status: CarStatus.getStatusByIndex(tabIndex)));
            },
          ),

        ],
          Expanded(child: buildConsumer(context)),
        ],
      ),
      tabs: isFilter ?  [
        TabModel(label: context.strings.all),
        TabModel(label: context.strings.new_),
        TabModel(label: context.strings.used),
      ] : null,
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return CarsScreen(
      cars: state.data ?? [],
        onToggleFavorite: (id) {
          bloc.toggleFavorite(id);
        },
        onRequestPrice: (id) {
          bloc.requestPrice(id);
        },
    );
    // return 0.ph;
  }

  @override
  String? title(BuildContext context) {
    return  isDetailsPage ? null  : isFilter ? context.strings.cars : context.strings.results_filter;
  }

  @override
  onAddButtonPressed() {
    HelperMethods.isAuth().then((value) {
      if(value == true) {
        pushNamed(Routes.sellCarPage);
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
      order: order,
      carModel: brandModelId,
    ));
  }
}

class CarsPageArgs {
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID});
}
