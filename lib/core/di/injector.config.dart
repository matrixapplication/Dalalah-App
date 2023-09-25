// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i10;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i28;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i27;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i20;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i41;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i48;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i53;
import '../../src/cars/data/data_sources/cars_datasource.dart' as _i7;
import '../../src/cars/data/repositories/cars_repo.dart' as _i22;
import '../../src/cars/domain/repositories/base_cars_repo.dart' as _i21;
import '../../src/cars/domain/use_cases/cars_usecase.dart' as _i38;
import '../../src/cars/presentation/cars/bloc/cars_bloc.dart' as _i49;
import '../../src/cars/presentation/cars_details/bloc/cars_details_bloc.dart'
    as _i50;
import '../../src/favorites/data/data_sources/favorites_datasource.dart' as _i8;
import '../../src/favorites/data/repositories/favorites_repo.dart' as _i24;
import '../../src/favorites/domain/repositories/base_favorites_repo.dart'
    as _i23;
import '../../src/favorites/domain/use_cases/favorites_usecase.dart' as _i39;
import '../../src/favorites/presentation/bloc/favorites_bloc.dart' as _i51;
import '../../src/filter/data/data_sources/filter_datasource.dart' as _i9;
import '../../src/filter/data/repositories/filter_repo.dart' as _i26;
import '../../src/filter/domain/repositories/base_filter_repo.dart' as _i25;
import '../../src/filter/domain/use_cases/filter_usecase.dart' as _i40;
import '../../src/filter/presentation/bloc/filter_bloc.dart' as _i52;
import '../../src/home/data/data_sources/home_datasource.dart' as _i11;
import '../../src/home/data/repositories/home_repo.dart' as _i30;
import '../../src/home/domain/repositories/base_home_repo.dart' as _i29;
import '../../src/home/domain/use_cases/home_usecase.dart' as _i42;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i54;
import '../../src/notifications/data/data_sources/notifications_datasource.dart'
    as _i13;
import '../../src/notifications/data/repositories/notifications_repo.dart'
    as _i32;
import '../../src/notifications/domain/repositories/base_notifications_repo.dart'
    as _i31;
import '../../src/notifications/domain/use_cases/notifications_usecase.dart'
    as _i43;
import '../../src/notifications/presentation/bloc/notifications_bloc.dart'
    as _i55;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i14;
import '../../src/profile/data/repositories/profile_repo.dart' as _i34;
import '../../src/profile/domain/repositories/base_profile_repo.dart' as _i33;
import '../../src/profile/domain/use_cases/profile_usecase.dart' as _i44;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i56;
import '../../src/sell_car/data/data_sources/sell_car_datasource.dart' as _i15;
import '../../src/sell_car/data/repositories/sell_car_repo.dart' as _i17;
import '../../src/sell_car/domain/repositories/base_sell_car_repo.dart' as _i35;
import '../../src/sell_car/domain/use_cases/sell_car_usecase.dart' as _i16;
import '../../src/sell_car/presentation/bloc/sell_car_bloc.dart' as _i45;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i18;
import '../../src/settings/data/repositories/settings_repo.dart' as _i37;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i36;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i46;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i47;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i12;
import 'injection_module.dart' as _i57;

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
  gh.factory<_i8.FavoritesDatasource>(
      () => _i8.FavoritesDatasource(gh<_i4.Dio>()));
  gh.factory<_i9.FilterDatasource>(() => _i9.FilterDatasource(gh<_i4.Dio>()));
  gh.factory<_i10.ForgotPasswordDataSource>(
      () => _i10.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i11.HomeDatasource>(() => _i11.HomeDatasource(gh<_i4.Dio>()));
  gh.factory<_i12.LanguageCubit>(() => _i12.LanguageCubit());
  gh.factory<_i13.NotificationsDatasource>(
      () => _i13.NotificationsDatasource(gh<_i4.Dio>()));
  gh.factory<_i14.ProfileDataSource>(
      () => _i14.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i15.SellCarDatasource>(
      () => _i15.SellCarDatasource(gh<_i4.Dio>()));
  gh.factory<_i16.SellCarUseCase>(
      () => _i16.SellCarUseCase(gh<_i17.SellCarRepo>()));
  gh.factory<_i18.SettingsDatasource>(
      () => _i18.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i19.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i20.AuthUseCase>(() => _i20.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i21.BaseCarsRepo>(() => _i22.TasksRepo(gh<_i7.CarsDatasource>()));
  gh.factory<_i23.BaseFavoritesRepo>(
      () => _i24.FavoritesRepo(gh<_i8.FavoritesDatasource>()));
  gh.factory<_i25.BaseFilterRepo>(
      () => _i26.FilterRepo(gh<_i9.FilterDatasource>()));
  gh.factory<_i27.BaseForgotPasswordRepo>(
      () => _i28.ForgotPasswordRepo(gh<_i10.ForgotPasswordDataSource>()));
  gh.factory<_i29.BaseHomeRepo>(() => _i30.HomeRepo(gh<_i11.HomeDatasource>()));
  gh.factory<_i31.BaseNotificationsRepo>(
      () => _i32.WalletRepo(gh<_i13.NotificationsDatasource>()));
  gh.factory<_i33.BaseProfileRepo<dynamic>>(
      () => _i34.ProfileRepo(gh<_i14.ProfileDataSource>()));
  gh.factory<_i35.BaseSellCarRepo>(
      () => _i17.SellCarRepo(gh<_i15.SellCarDatasource>()));
  gh.factory<_i36.BaseSettingsRepo>(
      () => _i37.SettingsRepo(gh<_i18.SettingsDatasource>()));
  gh.factory<_i38.CarsUseCase>(() => _i38.CarsUseCase(gh<_i21.BaseCarsRepo>()));
  gh.factory<_i39.FavoritesUseCase>(
      () => _i39.FavoritesUseCase(gh<_i23.BaseFavoritesRepo>()));
  gh.factory<_i40.FilterUseCase>(
      () => _i40.FilterUseCase(gh<_i25.BaseFilterRepo>()));
  gh.factory<_i41.ForgotPasswordUseCase>(
      () => _i41.ForgotPasswordUseCase(gh<_i27.BaseForgotPasswordRepo>()));
  gh.factory<_i42.HomeUseCase>(() => _i42.HomeUseCase(gh<_i29.BaseHomeRepo>()));
  gh.factory<_i43.NotificationsUseCase>(
      () => _i43.NotificationsUseCase(gh<_i31.BaseNotificationsRepo>()));
  gh.factory<_i44.ProfileUseCase>(
      () => _i44.ProfileUseCase(gh<_i33.BaseProfileRepo<dynamic>>()));
  gh.factory<_i45.SellCarCubit>(
      () => _i45.SellCarCubit(gh<_i16.SellCarUseCase>()));
  gh.factory<_i46.SettingsUseCase>(
      () => _i46.SettingsUseCase(gh<_i36.BaseSettingsRepo>()));
  gh.factory<_i47.AboutUsCubit>(
      () => _i47.AboutUsCubit(gh<_i46.SettingsUseCase>()));
  gh.factory<_i48.AuthCubit>(() => _i48.AuthCubit(gh<_i20.AuthUseCase>()));
  gh.factory<_i49.CarsCubit>(() => _i49.CarsCubit(gh<_i38.CarsUseCase>()));
  gh.factory<_i50.CarsDetailsCubit>(
      () => _i50.CarsDetailsCubit(gh<_i38.CarsUseCase>()));
  gh.factory<_i51.FavoritesCubit>(
      () => _i51.FavoritesCubit(gh<_i39.FavoritesUseCase>()));
  gh.factory<_i52.FilterCubit>(
      () => _i52.FilterCubit(gh<_i40.FilterUseCase>()));
  gh.factory<_i53.ForgotPasswordCubit>(
      () => _i53.ForgotPasswordCubit(gh<_i41.ForgotPasswordUseCase>()));
  gh.factory<_i54.HomeCubit>(() => _i54.HomeCubit(gh<_i42.HomeUseCase>()));
  gh.factory<_i55.NotificationsCubit>(
      () => _i55.NotificationsCubit(gh<_i43.NotificationsUseCase>()));
  gh.factory<_i56.ProfileBloc>(
      () => _i56.ProfileBloc(gh<_i44.ProfileUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i57.InjectionModule {}
