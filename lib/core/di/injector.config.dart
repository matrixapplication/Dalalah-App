// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i12;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i31;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i30;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i23;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i46;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i54;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i59;
import '../../src/cars/data/data_sources/cars_datasource.dart' as _i7;
import '../../src/cars/data/repositories/cars_repo.dart' as _i25;
import '../../src/cars/domain/repositories/base_cars_repo.dart' as _i24;
import '../../src/cars/domain/use_cases/cars_usecase.dart' as _i43;
import '../../src/cars/presentation/cars/bloc/cars_bloc.dart' as _i55;
import '../../src/cars/presentation/cars_details/bloc/cars_details_bloc.dart'
    as _i56;
import '../../src/exhibition/presentation/exhibition_details/bloc/exhibition_details_bloc.dart'
    as _i9;
import '../../src/exhibition/presentation/exhibitions/bloc/exhibition_bloc.dart'
    as _i8;
import '../../src/favorites_and_ads/data/data_sources/favorites_datasource.dart'
    as _i10;
import '../../src/favorites_and_ads/data/repositories/favorites_repo.dart'
    as _i27;
import '../../src/favorites_and_ads/domain/repositories/base_favorites_repo.dart'
    as _i26;
import '../../src/favorites_and_ads/domain/use_cases/favorites_usecase.dart'
    as _i44;
import '../../src/favorites_and_ads/presentation/bloc/favorites_bloc.dart'
    as _i57;
import '../../src/filter/data/data_sources/filter_datasource.dart' as _i11;
import '../../src/filter/data/repositories/filter_repo.dart' as _i29;
import '../../src/filter/domain/repositories/base_filter_repo.dart' as _i28;
import '../../src/filter/domain/use_cases/filter_usecase.dart' as _i45;
import '../../src/filter/presentation/bloc/filter_bloc.dart' as _i58;
import '../../src/home/data/data_sources/home_datasource.dart' as _i13;
import '../../src/home/data/repositories/home_repo.dart' as _i33;
import '../../src/home/domain/repositories/base_home_repo.dart' as _i32;
import '../../src/home/domain/use_cases/home_usecase.dart' as _i47;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i60;
import '../../src/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../src/notifications/data/repositories/notifications_repo.dart'
    as _i35;
import '../../src/notifications/domain/repositories/base_notifications_repo.dart'
    as _i34;
import '../../src/notifications/domain/use_cases/notifications_usecase.dart'
    as _i48;
import '../../src/notifications/presentation/bloc/notifications_bloc.dart'
    as _i61;
import '../../src/plates/data/data_sources/plates_datasource.dart' as _i16;
import '../../src/plates/data/repositories/plates_repo.dart' as _i37;
import '../../src/plates/domain/repositories/base_plates_repo.dart' as _i36;
import '../../src/plates/domain/use_cases/plates_usecase.dart' as _i49;
import '../../src/plates/presentation/plate_details/bloc/plates_details_bloc.dart'
    as _i63;
import '../../src/plates/presentation/plates/bloc/plates_bloc.dart' as _i62;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i17;
import '../../src/profile/data/repositories/profile_repo.dart' as _i39;
import '../../src/profile/domain/repositories/base_profile_repo.dart' as _i38;
import '../../src/profile/domain/use_cases/profile_usecase.dart' as _i50;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i64;
import '../../src/sell_car/data/data_sources/sell_car_datasource.dart' as _i18;
import '../../src/sell_car/data/repositories/sell_car_repo.dart' as _i20;
import '../../src/sell_car/domain/repositories/base_sell_car_repo.dart' as _i40;
import '../../src/sell_car/domain/use_cases/sell_car_usecase.dart' as _i19;
import '../../src/sell_car/presentation/bloc/sell_car_bloc.dart' as _i51;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i21;
import '../../src/settings/data/repositories/settings_repo.dart' as _i42;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i41;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i52;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i53;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i14;
import 'injection_module.dart' as _i65;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource(gh<_i4.Dio>()));
  gh.factory<_i5.BaseAuthRepo>(() => _i6.AuthRepo(gh<_i3.AuthDataSource>()));
  gh.factory<_i7.CarsDatasource>(() => _i7.CarsDatasource(gh<_i4.Dio>()));
  gh.factory<_i8.ExhibitionCubit>(() => _i8.ExhibitionCubit());
  gh.factory<_i9.ExhibitionDetailsCubit>(() => _i9.ExhibitionDetailsCubit());
  gh.factory<_i10.FavoritesDatasource>(
      () => _i10.FavoritesDatasource(gh<_i4.Dio>()));
  gh.factory<_i11.FilterDatasource>(() => _i11.FilterDatasource(gh<_i4.Dio>()));
  gh.factory<_i12.ForgotPasswordDataSource>(
      () => _i12.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i13.HomeDatasource>(() => _i13.HomeDatasource(gh<_i4.Dio>()));
  gh.factory<_i14.LanguageCubit>(() => _i14.LanguageCubit());
  gh.factory<_i15.NotificationsDatasource>(
      () => _i15.NotificationsDatasource(gh<_i4.Dio>()));
  gh.factory<_i16.PlatesDatasource>(() => _i16.PlatesDatasource(gh<_i4.Dio>()));
  gh.factory<_i17.ProfileDataSource>(
      () => _i17.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i18.SellCarDatasource>(
      () => _i18.SellCarDatasource(gh<_i4.Dio>()));
  gh.factory<_i19.SellCarUseCase>(
      () => _i19.SellCarUseCase(gh<_i20.SellCarRepo>()));
  gh.factory<_i21.SettingsDatasource>(
      () => _i21.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i22.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i23.AuthUseCase>(() => _i23.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i24.BaseCarsRepo>(() => _i25.TasksRepo(gh<_i7.CarsDatasource>()));
  gh.factory<_i26.BaseFavoritesRepo>(
      () => _i27.FavoritesRepo(gh<_i10.FavoritesDatasource>()));
  gh.factory<_i28.BaseFilterRepo>(
      () => _i29.FilterRepo(gh<_i11.FilterDatasource>()));
  gh.factory<_i30.BaseForgotPasswordRepo>(
      () => _i31.ForgotPasswordRepo(gh<_i12.ForgotPasswordDataSource>()));
  gh.factory<_i32.BaseHomeRepo>(() => _i33.HomeRepo(gh<_i13.HomeDatasource>()));
  gh.factory<_i34.BaseNotificationsRepo>(
      () => _i35.WalletRepo(gh<_i15.NotificationsDatasource>()));
  gh.factory<_i36.BasePlatesRepo>(
      () => _i37.PlatesRepo(gh<_i16.PlatesDatasource>()));
  gh.factory<_i38.BaseProfileRepo<dynamic>>(
      () => _i39.ProfileRepo(gh<_i17.ProfileDataSource>()));
  gh.factory<_i40.BaseSellCarRepo>(
      () => _i20.SellCarRepo(gh<_i18.SellCarDatasource>()));
  gh.factory<_i41.BaseSettingsRepo>(
      () => _i42.SettingsRepo(gh<_i21.SettingsDatasource>()));
  gh.factory<_i43.CarsUseCase>(() => _i43.CarsUseCase(gh<_i24.BaseCarsRepo>()));
  gh.factory<_i44.FavoritesUseCase>(
      () => _i44.FavoritesUseCase(gh<_i26.BaseFavoritesRepo>()));
  gh.factory<_i45.FilterUseCase>(
      () => _i45.FilterUseCase(gh<_i28.BaseFilterRepo>()));
  gh.factory<_i46.ForgotPasswordUseCase>(
      () => _i46.ForgotPasswordUseCase(gh<_i30.BaseForgotPasswordRepo>()));
  gh.factory<_i47.HomeUseCase>(() => _i47.HomeUseCase(gh<_i32.BaseHomeRepo>()));
  gh.factory<_i48.NotificationsUseCase>(
      () => _i48.NotificationsUseCase(gh<_i34.BaseNotificationsRepo>()));
  gh.factory<_i49.PlatesUseCase>(
      () => _i49.PlatesUseCase(gh<_i36.BasePlatesRepo>()));
  gh.factory<_i50.ProfileUseCase>(
      () => _i50.ProfileUseCase(gh<_i38.BaseProfileRepo<dynamic>>()));
  gh.factory<_i51.SellCarCubit>(
      () => _i51.SellCarCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i52.SettingsUseCase>(
      () => _i52.SettingsUseCase(gh<_i41.BaseSettingsRepo>()));
  gh.factory<_i53.AboutUsCubit>(
      () => _i53.AboutUsCubit(gh<_i52.SettingsUseCase>()));
  gh.factory<_i54.AuthCubit>(() => _i54.AuthCubit(gh<_i23.AuthUseCase>()));
  gh.factory<_i55.CarsCubit>(() => _i55.CarsCubit(gh<_i43.CarsUseCase>()));
  gh.factory<_i56.CarsDetailsCubit>(
      () => _i56.CarsDetailsCubit(gh<_i43.CarsUseCase>()));
  gh.factory<_i57.FavoritesCubit>(
      () => _i57.FavoritesCubit(gh<_i44.FavoritesUseCase>()));
  gh.factory<_i58.FilterCubit>(
      () => _i58.FilterCubit(gh<_i45.FilterUseCase>()));
  gh.factory<_i59.ForgotPasswordCubit>(
      () => _i59.ForgotPasswordCubit(gh<_i46.ForgotPasswordUseCase>()));
  gh.factory<_i60.HomeCubit>(() => _i60.HomeCubit(gh<_i47.HomeUseCase>()));
  gh.factory<_i61.NotificationsCubit>(
      () => _i61.NotificationsCubit(gh<_i48.NotificationsUseCase>()));
  gh.factory<_i62.PlatesCubit>(
      () => _i62.PlatesCubit(gh<_i49.PlatesUseCase>()));
  gh.factory<_i63.PlatesDetailsCubit>(
      () => _i63.PlatesDetailsCubit(gh<_i49.PlatesUseCase>()));
  gh.factory<_i64.ProfileBloc>(
      () => _i64.ProfileBloc(gh<_i50.ProfileUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i65.InjectionModule {}
