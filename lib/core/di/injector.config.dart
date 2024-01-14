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
    as _i10;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i34;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i33;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i25;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i58;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i79;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i88;
import '../../src/cars/data/data_sources/cars_datasource.dart' as _i7;
import '../../src/cars/data/repositories/cars_repo.dart' as _i28;
import '../../src/cars/domain/repositories/base_cars_repo.dart' as _i27;
import '../../src/cars/domain/use_cases/cars_usecase.dart' as _i54;
import '../../src/cars/presentation/cars/bloc/cars_bloc.dart' as _i81;
import '../../src/cars/presentation/cars_details/bloc/cars_details_bloc.dart'
    as _i82;
import '../../src/cars/presentation/cars_search/bloc/cars_search_bloc.dart'
    as _i53;
import '../../src/cars/presentation/comments/bloc/comments_bloc.dart' as _i55;
import '../../src/favorites_and_ads/data/data_sources/favorites_datasource.dart'
    as _i8;
import '../../src/favorites_and_ads/data/repositories/favorites_repo.dart'
    as _i30;
import '../../src/favorites_and_ads/domain/repositories/base_favorites_repo.dart'
    as _i29;
import '../../src/favorites_and_ads/domain/use_cases/favorites_usecase.dart'
    as _i56;
import '../../src/favorites_and_ads/presentation/favorites/bloc/favorite_cars_bloc.dart'
    as _i84;
import '../../src/favorites_and_ads/presentation/favorites/bloc/favorite_plates_bloc.dart'
    as _i85;
import '../../src/favorites_and_ads/presentation/my_ads/bloc/my_cars_bloc.dart'
    as _i61;
import '../../src/favorites_and_ads/presentation/my_ads/bloc/my_plates_bloc.dart'
    as _i91;
import '../../src/filter/data/data_sources/filter_datasource.dart' as _i9;
import '../../src/filter/data/repositories/filter_repo.dart' as _i32;
import '../../src/filter/domain/repositories/base_filter_repo.dart' as _i31;
import '../../src/filter/domain/use_cases/filter_usecase.dart' as _i57;
import '../../src/filter/presentation/bloc/filter_bloc.dart' as _i86;
import '../../src/home/data/data_sources/home_datasource.dart' as _i11;
import '../../src/home/data/repositories/home_repo.dart' as _i36;
import '../../src/home/domain/repositories/base_home_repo.dart' as _i35;
import '../../src/home/domain/use_cases/home_usecase.dart' as _i59;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i89;
import '../../src/installment/data/data_sources/installment_datasource.dart'
    as _i12;
import '../../src/installment/data/repositories/installment_repo.dart' as _i38;
import '../../src/installment/domain/repositories/base_installment_repo.dart'
    as _i37;
import '../../src/installment/domain/use_cases/installment_usecase.dart'
    as _i60;
import '../../src/installment/presentation/bloc/installment_bloc.dart' as _i90;
import '../../src/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../src/notifications/data/repositories/notifications_repo.dart'
    as _i40;
import '../../src/notifications/domain/repositories/base_notifications_repo.dart'
    as _i39;
import '../../src/notifications/domain/use_cases/notifications_usecase.dart'
    as _i62;
import '../../src/notifications/presentation/bloc/notifications_bloc.dart'
    as _i92;
import '../../src/plates/data/data_sources/plates_datasource.dart' as _i16;
import '../../src/plates/data/repositories/plates_repo.dart' as _i44;
import '../../src/plates/domain/repositories/base_plates_repo.dart' as _i43;
import '../../src/plates/domain/use_cases/plates_usecase.dart' as _i64;
import '../../src/plates/presentation/add_plate/bloc/add_plate_bloc.dart'
    as _i77;
import '../../src/plates/presentation/plate_details/bloc/plates_details_bloc.dart'
    as _i94;
import '../../src/plates/presentation/plates/bloc/plates_bloc.dart' as _i93;
import '../../src/price_requests/data/data_sources/price_requests_datasource.dart'
    as _i17;
import '../../src/price_requests/data/repositories/price_requests_repo.dart'
    as _i46;
import '../../src/price_requests/domain/repositories/base_price_requests_repo.dart'
    as _i45;
import '../../src/price_requests/domain/use_cases/price_requests_usecase.dart'
    as _i65;
import '../../src/price_requests/presentation/bloc/price_requests_bloc.dart'
    as _i95;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i18;
import '../../src/profile/data/repositories/profile_repo.dart' as _i48;
import '../../src/profile/domain/repositories/base_profile_repo.dart' as _i47;
import '../../src/profile/domain/use_cases/profile_usecase.dart' as _i66;
import '../../src/profile/presentation/bloc/edit_profile_bloc.dart' as _i83;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i96;
import '../../src/real_estate/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../src/real_estate/data/repositories/notifications_repo.dart'
    as _i42;
import '../../src/real_estate/domain/repositories/base_notifications_repo.dart'
    as _i41;
import '../../src/real_estate/domain/use_cases/notifications_usecase.dart'
    as _i63;
import '../../src/real_estate/presentation/bloc/real_estate_bloc.dart' as _i67;
import '../../src/sell_car/data/data_sources/sell_car_datasource.dart' as _i19;
import '../../src/sell_car/data/repositories/add_car_repo.dart' as _i21;
import '../../src/sell_car/domain/repositories/base_add_car_repo.dart' as _i26;
import '../../src/sell_car/domain/use_cases/sell_car_usecase.dart' as _i20;
import '../../src/sell_car/presentation/bloc/sell_car_bloc.dart' as _i68;
import '../../src/sell_car/presentation/bloc/sell_car_image_picker_bloc.dart'
    as _i69;
import '../../src/sell_car/presentation/bloc/sell_car_properites_bloc.dart'
    as _i70;
import '../../src/sell_car/presentation/bloc/sell_car_second_bloc.dart' as _i71;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i22;
import '../../src/settings/data/repositories/settings_repo.dart' as _i50;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i49;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i72;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i75;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i13;
import '../../src/settings/support/bloc/support_bloc.dart' as _i74;
import '../../src/showrooms/data/data_sources/showrooms_datasource.dart'
    as _i24;
import '../../src/showrooms/data/repositories/showrooms_repo.dart' as _i52;
import '../../src/showrooms/domain/repositories/base_showrooms_repo.dart'
    as _i51;
import '../../src/showrooms/domain/use_cases/showrooms_usecase.dart' as _i73;
import '../../src/showrooms/presentation/agencies/bloc/agencies_bloc.dart'
    as _i78;
import '../../src/showrooms/presentation/branches/add_branch/bloc/add_branch_bloc.dart'
    as _i76;
import '../../src/showrooms/presentation/branches/bloc/branches_bloc.dart'
    as _i80;
import '../../src/showrooms/presentation/showroom_details/bloc/showroom_cars_bloc.dart'
    as _i97;
import '../../src/showrooms/presentation/showroom_details/bloc/showroom_plates_bloc.dart'
    as _i99;
import '../../src/showrooms/presentation/showroom_details/bloc/showrooms_details_bloc.dart'
    as _i98;
import '../../src/showrooms/presentation/showrooms/bloc/followed_showrooms_bloc.dart'
    as _i87;
import '../../src/showrooms/presentation/showrooms/bloc/showrooms_bloc.dart'
    as _i100;
import 'injection_module.dart' as _i101;

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
  gh.factory<_i17.PriceRequestsDatasource>(
      () => _i17.PriceRequestsDatasource(gh<_i4.Dio>()));
  gh.factory<_i18.ProfileDataSource>(
      () => _i18.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i19.SellCarDatasource>(
      () => _i19.SellCarDatasource(gh<_i4.Dio>()));
  gh.factory<_i20.SellCarUseCase>(
      () => _i20.SellCarUseCase(gh<_i21.AddCarRepo>()));
  gh.factory<_i22.SettingsDatasource>(
      () => _i22.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i23.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i24.ShowroomsDatasource>(
      () => _i24.ShowroomsDatasource(gh<_i4.Dio>()));
  gh.factory<_i25.AuthUseCase>(() => _i25.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.lazySingleton<_i26.BaseAddCarRepo>(
      () => _i21.AddCarRepo(gh<_i19.SellCarDatasource>()));
  gh.factory<_i27.BaseCarsRepo>(() => _i28.CarsRepo(gh<_i7.CarsDatasource>()));
  gh.factory<_i29.BaseFavoritesRepo>(
      () => _i30.FavoritesRepo(gh<_i8.FavoritesDatasource>()));
  gh.factory<_i31.BaseFilterRepo>(
      () => _i32.FilterRepo(gh<_i9.FilterDatasource>()));
  gh.factory<_i33.BaseForgotPasswordRepo>(
      () => _i34.ForgotPasswordRepo(gh<_i10.ForgotPasswordDataSource>()));
  gh.factory<_i35.BaseHomeRepo>(() => _i36.HomeRepo(gh<_i11.HomeDatasource>()));
  gh.factory<_i37.BaseInstallmentRepo<dynamic>>(
      () => _i38.InstallmentRepo(gh<_i12.InstallmentDataSource>()));
  gh.factory<_i39.BaseNotificationsRepo>(
      () => _i40.WalletRepo(gh<_i14.NotificationsDatasource>()));
  gh.factory<_i41.BaseNotificationsRepo>(
      () => _i42.WalletRepo(gh<_i15.NotificationsDatasource>()));
  gh.factory<_i43.BasePlatesRepo>(
      () => _i44.PlatesRepo(gh<_i16.PlatesDatasource>()));
  gh.factory<_i45.BasePriceRequestsRepo>(
      () => _i46.WalletRepo(gh<_i17.PriceRequestsDatasource>()));
  gh.factory<_i47.BaseProfileRepo<dynamic>>(
      () => _i48.ProfileRepo(gh<_i18.ProfileDataSource>()));
  gh.factory<_i49.BaseSettingsRepo>(
      () => _i50.SettingsRepo(gh<_i22.SettingsDatasource>()));
  gh.factory<_i51.BaseShowroomsRepo>(
      () => _i52.ShowroomsRepo(gh<_i24.ShowroomsDatasource>()));
  gh.factory<_i53.CarsSearchCubit>(
      () => _i53.CarsSearchCubit(gh<_i20.SellCarUseCase>()));
  gh.factory<_i54.CarsUseCase>(() => _i54.CarsUseCase(gh<_i27.BaseCarsRepo>()));
  gh.factory<_i55.CommentsCubit>(
      () => _i55.CommentsCubit(gh<_i54.CarsUseCase>()));
  gh.factory<_i56.FavoritesUseCase>(
      () => _i56.FavoritesUseCase(gh<_i29.BaseFavoritesRepo>()));
  gh.factory<_i57.FilterUseCase>(
      () => _i57.FilterUseCase(gh<_i31.BaseFilterRepo>()));
  gh.factory<_i58.ForgotPasswordUseCase>(
      () => _i58.ForgotPasswordUseCase(gh<_i33.BaseForgotPasswordRepo>()));
  gh.factory<_i59.HomeUseCase>(() => _i59.HomeUseCase(gh<_i35.BaseHomeRepo>()));
  gh.factory<_i60.InstallmentUseCase>(
      () => _i60.InstallmentUseCase(gh<_i37.BaseInstallmentRepo<dynamic>>()));
  gh.factory<_i61.MyCarsCubit>(() => _i61.MyCarsCubit(
        gh<_i56.FavoritesUseCase>(),
        gh<_i54.CarsUseCase>(),
      ));
  gh.factory<_i62.NotificationsUseCase>(
      () => _i62.NotificationsUseCase(gh<_i39.BaseNotificationsRepo>()));
  gh.factory<_i63.NotificationsUseCase>(
      () => _i63.NotificationsUseCase(gh<_i41.BaseNotificationsRepo>()));
  gh.factory<_i64.PlatesUseCase>(
      () => _i64.PlatesUseCase(gh<_i43.BasePlatesRepo>()));
  gh.factory<_i65.PriceRequestsUseCase>(
      () => _i65.PriceRequestsUseCase(gh<_i45.BasePriceRequestsRepo>()));
  gh.factory<_i66.ProfileUseCase>(
      () => _i66.ProfileUseCase(gh<_i47.BaseProfileRepo<dynamic>>()));
  gh.factory<_i67.RealEstatePageCubit>(
      () => _i67.RealEstatePageCubit(gh<_i63.NotificationsUseCase>()));
  gh.factory<_i68.SellCarCubit>(() => _i68.SellCarCubit(
        gh<_i20.SellCarUseCase>(),
        gh<_i64.PlatesUseCase>(),
      ));
  gh.factory<_i69.SellCarImagePickerCubit>(
      () => _i69.SellCarImagePickerCubit(gh<_i20.SellCarUseCase>()));
  gh.factory<_i70.SellCarPropertiesCubit>(
      () => _i70.SellCarPropertiesCubit(gh<_i20.SellCarUseCase>()));
  gh.factory<_i71.SellCarSecondCubit>(
      () => _i71.SellCarSecondCubit(gh<_i20.SellCarUseCase>()));
  gh.factory<_i72.SettingsUseCase>(
      () => _i72.SettingsUseCase(gh<_i49.BaseSettingsRepo>()));
  gh.factory<_i73.ShowroomsUseCase>(
      () => _i73.ShowroomsUseCase(gh<_i51.BaseShowroomsRepo>()));
  gh.factory<_i74.SupportCubit>(
      () => _i74.SupportCubit(gh<_i72.SettingsUseCase>()));
  gh.factory<_i75.AboutUsCubit>(
      () => _i75.AboutUsCubit(gh<_i72.SettingsUseCase>()));
  gh.factory<_i76.AddBranchCubit>(() => _i76.AddBranchCubit(
        gh<_i73.ShowroomsUseCase>(),
        gh<_i20.SellCarUseCase>(),
      ));
  gh.factory<_i77.AddPlateCubit>(() => _i77.AddPlateCubit(
        gh<_i64.PlatesUseCase>(),
        gh<_i20.SellCarUseCase>(),
      ));
  gh.factory<_i78.AgencyCubit>(
      () => _i78.AgencyCubit(gh<_i73.ShowroomsUseCase>()));
  gh.factory<_i79.AuthCubit>(() => _i79.AuthCubit(
        gh<_i25.AuthUseCase>(),
        gh<_i20.SellCarUseCase>(),
      ));
  gh.factory<_i80.BranchesCubit>(
      () => _i80.BranchesCubit(gh<_i73.ShowroomsUseCase>()));
  gh.factory<_i81.CarsCubit>(() => _i81.CarsCubit(
        gh<_i59.HomeUseCase>(),
        gh<_i56.FavoritesUseCase>(),
        gh<_i54.CarsUseCase>(),
        gh<_i20.SellCarUseCase>(),
        gh<_i65.PriceRequestsUseCase>(),
      ));
  gh.factory<_i82.CarsDetailsCubit>(() => _i82.CarsDetailsCubit(
        gh<_i54.CarsUseCase>(),
        gh<_i56.FavoritesUseCase>(),
      ));
  gh.factory<_i83.EditProfileBloc>(() => _i83.EditProfileBloc(
        gh<_i66.ProfileUseCase>(),
        gh<_i20.SellCarUseCase>(),
      ));
  gh.factory<_i84.FavoriteCarsCubit>(
      () => _i84.FavoriteCarsCubit(gh<_i56.FavoritesUseCase>()));
  gh.factory<_i85.FavoritePlatesCubit>(
      () => _i85.FavoritePlatesCubit(gh<_i56.FavoritesUseCase>()));
  gh.factory<_i86.FilterCubit>(
      () => _i86.FilterCubit(gh<_i57.FilterUseCase>()));
  gh.factory<_i87.FollowedShowroomsCubit>(
      () => _i87.FollowedShowroomsCubit(gh<_i73.ShowroomsUseCase>()));
  gh.factory<_i88.ForgotPasswordCubit>(
      () => _i88.ForgotPasswordCubit(gh<_i58.ForgotPasswordUseCase>()));
  gh.factory<_i89.HomeCubit>(() => _i89.HomeCubit(
        gh<_i59.HomeUseCase>(),
        gh<_i56.FavoritesUseCase>(),
        gh<_i64.PlatesUseCase>(),
      ));
  gh.factory<_i90.InstallmentBloc>(
      () => _i90.InstallmentBloc(gh<_i60.InstallmentUseCase>()));
  gh.factory<_i91.MyPlatesCubit>(() => _i91.MyPlatesCubit(
        gh<_i56.FavoritesUseCase>(),
        gh<_i64.PlatesUseCase>(),
      ));
  gh.factory<_i92.NotificationsCubit>(
      () => _i92.NotificationsCubit(gh<_i62.NotificationsUseCase>()));
  gh.factory<_i93.PlatesCubit>(() => _i93.PlatesCubit(
        gh<_i64.PlatesUseCase>(),
        gh<_i56.FavoritesUseCase>(),
      ));
  gh.factory<_i94.PlatesDetailsCubit>(() => _i94.PlatesDetailsCubit(
        gh<_i64.PlatesUseCase>(),
        gh<_i56.FavoritesUseCase>(),
      ));
  gh.factory<_i95.PriceRequestsCubit>(
      () => _i95.PriceRequestsCubit(gh<_i65.PriceRequestsUseCase>()));
  gh.factory<_i96.ProfileBloc>(
      () => _i96.ProfileBloc(gh<_i66.ProfileUseCase>()));
  gh.factory<_i97.ShowroomCarsCubit>(() => _i97.ShowroomCarsCubit(
        gh<_i73.ShowroomsUseCase>(),
        gh<_i56.FavoritesUseCase>(),
      ));
  gh.factory<_i98.ShowroomDetailsCubit>(
      () => _i98.ShowroomDetailsCubit(gh<_i73.ShowroomsUseCase>()));
  gh.factory<_i99.ShowroomPlateCubit>(() => _i99.ShowroomPlateCubit(
        gh<_i73.ShowroomsUseCase>(),
        gh<_i56.FavoritesUseCase>(),
      ));
  gh.factory<_i100.ShowroomsCubit>(
      () => _i100.ShowroomsCubit(gh<_i73.ShowroomsUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i101.InjectionModule {}
