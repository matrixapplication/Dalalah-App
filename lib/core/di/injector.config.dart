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
    as _i10;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i33;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i32;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i24;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i55;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i75;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i83;
import '../../src/cars/data/data_sources/cars_datasource.dart' as _i7;
import '../../src/cars/data/repositories/cars_repo.dart' as _i27;
import '../../src/cars/domain/repositories/base_cars_repo.dart' as _i26;
import '../../src/cars/domain/use_cases/cars_usecase.dart' as _i51;
import '../../src/cars/presentation/cars/bloc/cars_bloc.dart' as _i77;
import '../../src/cars/presentation/cars_details/bloc/cars_details_bloc.dart'
    as _i78;
import '../../src/cars/presentation/cars_search/bloc/cars_search_bloc.dart'
    as _i50;
import '../../src/cars/presentation/comments/bloc/comments_bloc.dart' as _i52;
import '../../src/favorites_and_ads/data/data_sources/favorites_datasource.dart'
    as _i8;
import '../../src/favorites_and_ads/data/repositories/favorites_repo.dart'
    as _i29;
import '../../src/favorites_and_ads/domain/repositories/base_favorites_repo.dart'
    as _i28;
import '../../src/favorites_and_ads/domain/use_cases/favorites_usecase.dart'
    as _i53;
import '../../src/favorites_and_ads/presentation/favorites/bloc/favorite_cars_bloc.dart'
    as _i80;
import '../../src/favorites_and_ads/presentation/favorites/bloc/favorite_plates_bloc.dart'
    as _i81;
import '../../src/favorites_and_ads/presentation/my_ads/bloc/my_cars_bloc.dart'
    as _i58;
import '../../src/favorites_and_ads/presentation/my_ads/bloc/my_plates_bloc.dart'
    as _i59;
import '../../src/filter/data/data_sources/filter_datasource.dart' as _i9;
import '../../src/filter/data/repositories/filter_repo.dart' as _i31;
import '../../src/filter/domain/repositories/base_filter_repo.dart' as _i30;
import '../../src/filter/domain/use_cases/filter_usecase.dart' as _i54;
import '../../src/filter/presentation/bloc/filter_bloc.dart' as _i82;
import '../../src/home/data/data_sources/home_datasource.dart' as _i11;
import '../../src/home/data/repositories/home_repo.dart' as _i35;
import '../../src/home/domain/repositories/base_home_repo.dart' as _i34;
import '../../src/home/domain/use_cases/home_usecase.dart' as _i56;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i84;
import '../../src/installment/data/data_sources/installment_datasource.dart'
    as _i12;
import '../../src/installment/data/repositories/installment_repo.dart' as _i37;
import '../../src/installment/domain/repositories/base_installment_repo.dart'
    as _i36;
import '../../src/installment/domain/use_cases/installment_usecase.dart'
    as _i57;
import '../../src/installment/presentation/bloc/installment_bloc.dart' as _i85;
import '../../src/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../src/notifications/data/repositories/notifications_repo.dart'
    as _i39;
import '../../src/notifications/domain/repositories/base_notifications_repo.dart'
    as _i38;
import '../../src/notifications/domain/use_cases/notifications_usecase.dart'
    as _i60;
import '../../src/notifications/presentation/bloc/notifications_bloc.dart'
    as _i86;
import '../../src/plates/data/data_sources/plates_datasource.dart' as _i16;
import '../../src/plates/data/repositories/plates_repo.dart' as _i43;
import '../../src/plates/domain/repositories/base_plates_repo.dart' as _i42;
import '../../src/plates/domain/use_cases/plates_usecase.dart' as _i62;
import '../../src/plates/presentation/add_plate/bloc/add_plate_bloc.dart'
    as _i73;
import '../../src/plates/presentation/plate_details/bloc/plates_details_bloc.dart'
    as _i88;
import '../../src/plates/presentation/plates/bloc/plates_bloc.dart' as _i87;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i17;
import '../../src/profile/data/repositories/profile_repo.dart' as _i45;
import '../../src/profile/domain/repositories/base_profile_repo.dart' as _i44;
import '../../src/profile/domain/use_cases/profile_usecase.dart' as _i63;
import '../../src/profile/presentation/bloc/edit_profile_bloc.dart' as _i79;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i89;
import '../../src/real_estate/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../src/real_estate/data/repositories/notifications_repo.dart'
    as _i41;
import '../../src/real_estate/domain/repositories/base_notifications_repo.dart'
    as _i40;
import '../../src/real_estate/domain/use_cases/notifications_usecase.dart'
    as _i61;
import '../../src/real_estate/presentation/bloc/real_estate_bloc.dart' as _i64;
import '../../src/sell_car/data/data_sources/sell_car_datasource.dart' as _i18;
import '../../src/sell_car/data/repositories/add_car_repo.dart' as _i20;
import '../../src/sell_car/domain/repositories/base_add_car_repo.dart' as _i25;
import '../../src/sell_car/domain/use_cases/sell_car_usecase.dart' as _i19;
import '../../src/sell_car/presentation/bloc/sell_car_bloc.dart' as _i65;
import '../../src/sell_car/presentation/bloc/sell_car_image_picker_bloc.dart'
    as _i66;
import '../../src/sell_car/presentation/bloc/sell_car_properites_bloc.dart'
    as _i67;
import '../../src/sell_car/presentation/bloc/sell_car_second_bloc.dart' as _i68;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i21;
import '../../src/settings/data/repositories/settings_repo.dart' as _i47;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i46;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i69;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i71;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i13;
import '../../src/showrooms/data/data_sources/showrooms_datasource.dart'
    as _i23;
import '../../src/showrooms/data/repositories/showrooms_repo.dart' as _i49;
import '../../src/showrooms/domain/repositories/base_showrooms_repo.dart'
    as _i48;
import '../../src/showrooms/domain/use_cases/showrooms_usecase.dart' as _i70;
import '../../src/showrooms/presentation/agencies/bloc/agencies_bloc.dart'
    as _i74;
import '../../src/showrooms/presentation/branches/add_branch/bloc/add_branch_bloc.dart'
    as _i72;
import '../../src/showrooms/presentation/branches/bloc/branches_bloc.dart'
    as _i76;
import '../../src/showrooms/presentation/showroom_details/bloc/showroom_cars_bloc.dart'
    as _i90;
import '../../src/showrooms/presentation/showroom_details/bloc/showrooms_details_bloc.dart'
    as _i91;
import '../../src/showrooms/presentation/showrooms/bloc/showrooms_bloc.dart'
    as _i92;
import 'injection_module.dart' as _i93;

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
  gh.factory<_i12.InstallmentDataSource>(
      () => _i12.InstallmentDataSource(gh<_i4.Dio>()));
  gh.factory<_i13.LanguageCubit>(() => _i13.LanguageCubit());
  gh.factory<_i14.NotificationsDatasource>(
      () => _i14.NotificationsDatasource(gh<_i4.Dio>()));
  gh.factory<_i15.NotificationsDatasource>(
      () => _i15.NotificationsDatasource(gh<_i4.Dio>()));
  gh.factory<_i16.PlatesDatasource>(() => _i16.PlatesDatasource(gh<_i4.Dio>()));
  gh.factory<_i17.ProfileDataSource>(
      () => _i17.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i18.SellCarDatasource>(
      () => _i18.SellCarDatasource(gh<_i4.Dio>()));
  gh.factory<_i19.SellCarUseCase>(
      () => _i19.SellCarUseCase(gh<_i20.AddCarRepo>()));
  gh.factory<_i21.SettingsDatasource>(
      () => _i21.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i22.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i23.ShowroomsDatasource>(
      () => _i23.ShowroomsDatasource(gh<_i4.Dio>()));
  gh.factory<_i24.AuthUseCase>(() => _i24.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.lazySingleton<_i25.BaseAddCarRepo>(
      () => _i20.AddCarRepo(gh<_i18.SellCarDatasource>()));
  gh.factory<_i26.BaseCarsRepo>(() => _i27.CarsRepo(gh<_i7.CarsDatasource>()));
  gh.factory<_i28.BaseFavoritesRepo>(
      () => _i29.FavoritesRepo(gh<_i8.FavoritesDatasource>()));
  gh.factory<_i30.BaseFilterRepo>(
      () => _i31.FilterRepo(gh<_i9.FilterDatasource>()));
  gh.factory<_i32.BaseForgotPasswordRepo>(
      () => _i33.ForgotPasswordRepo(gh<_i10.ForgotPasswordDataSource>()));
  gh.factory<_i34.BaseHomeRepo>(() => _i35.HomeRepo(gh<_i11.HomeDatasource>()));
  gh.factory<_i36.BaseInstallmentRepo<dynamic>>(
      () => _i37.InstallmentRepo(gh<_i12.InstallmentDataSource>()));
  gh.factory<_i38.BaseNotificationsRepo>(
      () => _i39.WalletRepo(gh<_i14.NotificationsDatasource>()));
  gh.factory<_i40.BaseNotificationsRepo>(
      () => _i41.WalletRepo(gh<_i15.NotificationsDatasource>()));
  gh.factory<_i42.BasePlatesRepo>(
      () => _i43.PlatesRepo(gh<_i16.PlatesDatasource>()));
  gh.factory<_i44.BaseProfileRepo<dynamic>>(
      () => _i45.ProfileRepo(gh<_i17.ProfileDataSource>()));
  gh.factory<_i46.BaseSettingsRepo>(
      () => _i47.SettingsRepo(gh<_i21.SettingsDatasource>()));
  gh.factory<_i48.BaseShowroomsRepo>(
      () => _i49.ShowroomsRepo(gh<_i23.ShowroomsDatasource>()));
  gh.factory<_i50.CarsSearchCubit>(
      () => _i50.CarsSearchCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i51.CarsUseCase>(() => _i51.CarsUseCase(gh<_i26.BaseCarsRepo>()));
  gh.factory<_i52.CommentsCubit>(
      () => _i52.CommentsCubit(gh<_i51.CarsUseCase>()));
  gh.factory<_i53.FavoritesUseCase>(
      () => _i53.FavoritesUseCase(gh<_i28.BaseFavoritesRepo>()));
  gh.factory<_i54.FilterUseCase>(
      () => _i54.FilterUseCase(gh<_i30.BaseFilterRepo>()));
  gh.factory<_i55.ForgotPasswordUseCase>(
      () => _i55.ForgotPasswordUseCase(gh<_i32.BaseForgotPasswordRepo>()));
  gh.factory<_i56.HomeUseCase>(() => _i56.HomeUseCase(gh<_i34.BaseHomeRepo>()));
  gh.factory<_i57.InstallmentUseCase>(
      () => _i57.InstallmentUseCase(gh<_i36.BaseInstallmentRepo<dynamic>>()));
  gh.factory<_i58.MyCarsCubit>(
      () => _i58.MyCarsCubit(gh<_i53.FavoritesUseCase>()));
  gh.factory<_i59.MyPlatesCubit>(
      () => _i59.MyPlatesCubit(gh<_i53.FavoritesUseCase>()));
  gh.factory<_i60.NotificationsUseCase>(
      () => _i60.NotificationsUseCase(gh<_i38.BaseNotificationsRepo>()));
  gh.factory<_i61.NotificationsUseCase>(
      () => _i61.NotificationsUseCase(gh<_i40.BaseNotificationsRepo>()));
  gh.factory<_i62.PlatesUseCase>(
      () => _i62.PlatesUseCase(gh<_i42.BasePlatesRepo>()));
  gh.factory<_i63.ProfileUseCase>(
      () => _i63.ProfileUseCase(gh<_i44.BaseProfileRepo<dynamic>>()));
  gh.factory<_i64.RealEstatePageCubit>(
      () => _i64.RealEstatePageCubit(gh<_i61.NotificationsUseCase>()));
  gh.factory<_i65.SellCarCubit>(
      () => _i65.SellCarCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i66.SellCarImagePickerCubit>(
      () => _i66.SellCarImagePickerCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i67.SellCarPropertiesCubit>(
      () => _i67.SellCarPropertiesCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i68.SellCarSecondCubit>(
      () => _i68.SellCarSecondCubit(gh<_i19.SellCarUseCase>()));
  gh.factory<_i69.SettingsUseCase>(
      () => _i69.SettingsUseCase(gh<_i46.BaseSettingsRepo>()));
  gh.factory<_i70.ShowroomsUseCase>(
      () => _i70.ShowroomsUseCase(gh<_i48.BaseShowroomsRepo>()));
  gh.factory<_i71.AboutUsCubit>(
      () => _i71.AboutUsCubit(gh<_i69.SettingsUseCase>()));
  gh.factory<_i72.AddBranchCubit>(() => _i72.AddBranchCubit(
        gh<_i70.ShowroomsUseCase>(),
        gh<_i19.SellCarUseCase>(),
      ));
  gh.factory<_i73.AddPlateCubit>(() => _i73.AddPlateCubit(
        gh<_i62.PlatesUseCase>(),
        gh<_i19.SellCarUseCase>(),
      ));
  gh.factory<_i74.AgencyCubit>(
      () => _i74.AgencyCubit(gh<_i70.ShowroomsUseCase>()));
  gh.factory<_i75.AuthCubit>(() => _i75.AuthCubit(
        gh<_i24.AuthUseCase>(),
        gh<_i19.SellCarUseCase>(),
      ));
  gh.factory<_i76.BranchesCubit>(
      () => _i76.BranchesCubit(gh<_i70.ShowroomsUseCase>()));
  gh.factory<_i77.CarsCubit>(() => _i77.CarsCubit(
        gh<_i56.HomeUseCase>(),
        gh<_i53.FavoritesUseCase>(),
        gh<_i51.CarsUseCase>(),
        gh<_i19.SellCarUseCase>(),
      ));
  gh.factory<_i78.CarsDetailsCubit>(() => _i78.CarsDetailsCubit(
        gh<_i51.CarsUseCase>(),
        gh<_i53.FavoritesUseCase>(),
      ));
  gh.factory<_i79.EditProfileBloc>(() => _i79.EditProfileBloc(
        gh<_i63.ProfileUseCase>(),
        gh<_i19.SellCarUseCase>(),
      ));
  gh.factory<_i80.FavoriteCarsCubit>(
      () => _i80.FavoriteCarsCubit(gh<_i53.FavoritesUseCase>()));
  gh.factory<_i81.FavoritePlatesCubit>(
      () => _i81.FavoritePlatesCubit(gh<_i53.FavoritesUseCase>()));
  gh.factory<_i82.FilterCubit>(
      () => _i82.FilterCubit(gh<_i54.FilterUseCase>()));
  gh.factory<_i83.ForgotPasswordCubit>(
      () => _i83.ForgotPasswordCubit(gh<_i55.ForgotPasswordUseCase>()));
  gh.factory<_i84.HomeCubit>(() => _i84.HomeCubit(
        gh<_i56.HomeUseCase>(),
        gh<_i53.FavoritesUseCase>(),
        gh<_i62.PlatesUseCase>(),
      ));
  gh.factory<_i85.InstallmentBloc>(
      () => _i85.InstallmentBloc(gh<_i57.InstallmentUseCase>()));
  gh.factory<_i86.NotificationsCubit>(
      () => _i86.NotificationsCubit(gh<_i60.NotificationsUseCase>()));
  gh.factory<_i87.PlatesCubit>(() => _i87.PlatesCubit(
        gh<_i62.PlatesUseCase>(),
        gh<_i53.FavoritesUseCase>(),
      ));
  gh.factory<_i88.PlatesDetailsCubit>(() => _i88.PlatesDetailsCubit(
        gh<_i62.PlatesUseCase>(),
        gh<_i53.FavoritesUseCase>(),
      ));
  gh.factory<_i89.ProfileBloc>(
      () => _i89.ProfileBloc(gh<_i63.ProfileUseCase>()));
  gh.factory<_i90.ShowroomCarsCubit>(
      () => _i90.ShowroomCarsCubit(gh<_i70.ShowroomsUseCase>()));
  gh.factory<_i91.ShowroomDetailsCubit>(
      () => _i91.ShowroomDetailsCubit(gh<_i70.ShowroomsUseCase>()));
  gh.factory<_i92.ShowroomsCubit>(
      () => _i92.ShowroomsCubit(gh<_i70.ShowroomsUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i93.InjectionModule {}
