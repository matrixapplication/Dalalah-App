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
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i12;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i32;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i31;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i24;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i49;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i59;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i64;
import '../../src/cars/data/data_sources/cars_datasource.dart' as _i7;
import '../../src/cars/data/repositories/cars_repo.dart' as _i26;
import '../../src/cars/domain/repositories/base_cars_repo.dart' as _i25;
import '../../src/cars/domain/use_cases/cars_usecase.dart' as _i46;
import '../../src/cars/presentation/cars/bloc/cars_bloc.dart' as _i60;
import '../../src/cars/presentation/cars_details/bloc/cars_details_bloc.dart'
    as _i61;
import '../../src/exhibition/presentation/exhibition_details/bloc/exhibition_details_bloc.dart'
    as _i9;
import '../../src/exhibition/presentation/exhibitions/bloc/exhibition_bloc.dart'
    as _i8;
import '../../src/favorites_and_ads/data/data_sources/favorites_datasource.dart'
    as _i10;
import '../../src/favorites_and_ads/data/repositories/favorites_repo.dart'
    as _i28;
import '../../src/favorites_and_ads/domain/repositories/base_favorites_repo.dart'
    as _i27;
import '../../src/favorites_and_ads/domain/use_cases/favorites_usecase.dart'
    as _i47;
import '../../src/favorites_and_ads/presentation/bloc/favorites_bloc.dart'
    as _i62;
import '../../src/filter/data/data_sources/filter_datasource.dart' as _i11;
import '../../src/filter/data/repositories/filter_repo.dart' as _i30;
import '../../src/filter/domain/repositories/base_filter_repo.dart' as _i29;
import '../../src/filter/domain/use_cases/filter_usecase.dart' as _i48;
import '../../src/filter/presentation/bloc/filter_bloc.dart' as _i63;
import '../../src/home/data/data_sources/home_datasource.dart' as _i13;
import '../../src/home/data/repositories/home_repo.dart' as _i34;
import '../../src/home/domain/repositories/base_home_repo.dart' as _i33;
import '../../src/home/domain/use_cases/home_usecase.dart' as _i50;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i65;
import '../../src/installment/data/data_sources/installment_datasource.dart'
    as _i14;
import '../../src/installment/data/repositories/installment_repo.dart' as _i36;
import '../../src/installment/domain/repositories/base_installment_repo.dart'
    as _i35;
import '../../src/installment/domain/use_cases/installment_usecase.dart'
    as _i51;
import '../../src/installment/presentation/bloc/installment_bloc.dart' as _i54;
import '../../src/notifications/data/data_sources/notifications_datasource.dart'
    as _i16;
import '../../src/notifications/data/repositories/notifications_repo.dart'
    as _i38;
import '../../src/notifications/domain/repositories/base_notifications_repo.dart'
    as _i37;
import '../../src/notifications/domain/use_cases/notifications_usecase.dart'
    as _i52;
import '../../src/notifications/presentation/bloc/notifications_bloc.dart'
    as _i66;
import '../../src/plates/data/data_sources/plates_datasource.dart' as _i17;
import '../../src/plates/data/repositories/plates_repo.dart' as _i40;
import '../../src/plates/domain/repositories/base_plates_repo.dart' as _i39;
import '../../src/plates/domain/use_cases/plates_usecase.dart' as _i53;
import '../../src/plates/presentation/plate_details/bloc/plates_details_bloc.dart'
    as _i68;
import '../../src/plates/presentation/plates/bloc/plates_bloc.dart' as _i67;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i18;
import '../../src/profile/data/repositories/profile_repo.dart' as _i42;
import '../../src/profile/domain/repositories/base_profile_repo.dart' as _i41;
import '../../src/profile/domain/use_cases/profile_usecase.dart' as _i55;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i69;
import '../../src/sell_car/data/data_sources/sell_car_datasource.dart' as _i19;
import '../../src/sell_car/data/repositories/sell_car_repo.dart' as _i21;
import '../../src/sell_car/domain/repositories/base_sell_car_repo.dart' as _i43;
import '../../src/sell_car/domain/use_cases/sell_car_usecase.dart' as _i20;
import '../../src/sell_car/presentation/bloc/sell_car_bloc.dart' as _i56;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i22;
import '../../src/settings/data/repositories/settings_repo.dart' as _i45;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i44;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i57;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i58;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i15;
import 'injection_module.dart' as _i70;

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
  gh.factory<_i14.InstallmentDataSource>(
      () => _i14.InstallmentDataSource(gh<_i4.Dio>()));
  gh.factory<_i15.LanguageCubit>(() => _i15.LanguageCubit());
  gh.factory<_i16.NotificationsDatasource>(
      () => _i16.NotificationsDatasource(gh<_i4.Dio>()));
  gh.factory<_i17.PlatesDatasource>(() => _i17.PlatesDatasource(gh<_i4.Dio>()));
  gh.factory<_i18.ProfileDataSource>(
      () => _i18.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i19.SellCarDatasource>(
      () => _i19.SellCarDatasource(gh<_i4.Dio>()));
  gh.factory<_i20.SellCarUseCase>(
      () => _i20.SellCarUseCase(gh<_i21.SellCarRepo>()));
  gh.factory<_i22.SettingsDatasource>(
      () => _i22.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i23.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i24.AuthUseCase>(() => _i24.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i25.BaseCarsRepo>(() => _i26.TasksRepo(gh<_i7.CarsDatasource>()));
  gh.factory<_i27.BaseFavoritesRepo>(
      () => _i28.FavoritesRepo(gh<_i10.FavoritesDatasource>()));
  gh.factory<_i29.BaseFilterRepo>(
      () => _i30.FilterRepo(gh<_i11.FilterDatasource>()));
  gh.factory<_i31.BaseForgotPasswordRepo>(
      () => _i32.ForgotPasswordRepo(gh<_i12.ForgotPasswordDataSource>()));
  gh.factory<_i33.BaseHomeRepo>(() => _i34.HomeRepo(gh<_i13.HomeDatasource>()));
  gh.factory<_i35.BaseInstallmentRepo<dynamic>>(
      () => _i36.InstallmentRepo(gh<_i14.InstallmentDataSource>()));
  gh.factory<_i37.BaseNotificationsRepo>(
      () => _i38.WalletRepo(gh<_i16.NotificationsDatasource>()));
  gh.factory<_i39.BasePlatesRepo>(
      () => _i40.PlatesRepo(gh<_i17.PlatesDatasource>()));
  gh.factory<_i41.BaseProfileRepo<dynamic>>(
      () => _i42.ProfileRepo(gh<_i18.ProfileDataSource>()));
  gh.factory<_i43.BaseSellCarRepo>(
      () => _i21.SellCarRepo(gh<_i19.SellCarDatasource>()));
  gh.factory<_i44.BaseSettingsRepo>(
      () => _i45.SettingsRepo(gh<_i22.SettingsDatasource>()));
  gh.factory<_i46.CarsUseCase>(() => _i46.CarsUseCase(gh<_i25.BaseCarsRepo>()));
  gh.factory<_i47.FavoritesUseCase>(
      () => _i47.FavoritesUseCase(gh<_i27.BaseFavoritesRepo>()));
  gh.factory<_i48.FilterUseCase>(
      () => _i48.FilterUseCase(gh<_i29.BaseFilterRepo>()));
  gh.factory<_i49.ForgotPasswordUseCase>(
      () => _i49.ForgotPasswordUseCase(gh<_i31.BaseForgotPasswordRepo>()));
  gh.factory<_i50.HomeUseCase>(() => _i50.HomeUseCase(gh<_i33.BaseHomeRepo>()));
  gh.factory<_i51.InstallmentUseCase>(
      () => _i51.InstallmentUseCase(gh<_i35.BaseInstallmentRepo<dynamic>>()));
  gh.factory<_i52.NotificationsUseCase>(
      () => _i52.NotificationsUseCase(gh<_i37.BaseNotificationsRepo>()));
  gh.factory<_i53.PlatesUseCase>(
      () => _i53.PlatesUseCase(gh<_i39.BasePlatesRepo>()));
  gh.factory<_i54.ProfileBloc>(
      () => _i54.ProfileBloc(gh<_i51.InstallmentUseCase>()));
  gh.factory<_i55.ProfileUseCase>(
      () => _i55.ProfileUseCase(gh<_i41.BaseProfileRepo<dynamic>>()));
  gh.factory<_i56.SellCarCubit>(
      () => _i56.SellCarCubit(gh<_i20.SellCarUseCase>()));
  gh.factory<_i57.SettingsUseCase>(
      () => _i57.SettingsUseCase(gh<_i44.BaseSettingsRepo>()));
  gh.factory<_i58.AboutUsCubit>(
      () => _i58.AboutUsCubit(gh<_i57.SettingsUseCase>()));
  gh.factory<_i59.AuthCubit>(() => _i59.AuthCubit(gh<_i24.AuthUseCase>()));
  gh.factory<_i60.CarsCubit>(() => _i60.CarsCubit(gh<_i46.CarsUseCase>()));
  gh.factory<_i61.CarsDetailsCubit>(
      () => _i61.CarsDetailsCubit(gh<_i46.CarsUseCase>()));
  gh.factory<_i62.FavoritesCubit>(
      () => _i62.FavoritesCubit(gh<_i47.FavoritesUseCase>()));
  gh.factory<_i63.FilterCubit>(
      () => _i63.FilterCubit(gh<_i48.FilterUseCase>()));
  gh.factory<_i64.ForgotPasswordCubit>(
      () => _i64.ForgotPasswordCubit(gh<_i49.ForgotPasswordUseCase>()));
  gh.factory<_i65.HomeCubit>(() => _i65.HomeCubit(gh<_i50.HomeUseCase>()));
  gh.factory<_i66.NotificationsCubit>(
      () => _i66.NotificationsCubit(gh<_i52.NotificationsUseCase>()));
  gh.factory<_i67.PlatesCubit>(
      () => _i67.PlatesCubit(gh<_i53.PlatesUseCase>()));
  gh.factory<_i68.PlatesDetailsCubit>(
      () => _i68.PlatesDetailsCubit(gh<_i53.PlatesUseCase>()));
  gh.factory<_i69.ProfileBloc>(
      () => _i69.ProfileBloc(gh<_i55.ProfileUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i70.InjectionModule {}
