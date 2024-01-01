import 'package:flutter/cupertino.dart';

import '../../navigation_pages.dart';
import '../../src/auth/presentation/pages/forget-password/enter_phone_number_page.dart';
import '../../src/auth/presentation/pages/forget-password/enter_pin_code_page.dart';
import '../../src/auth/presentation/pages/forget-password/new_password_page.dart';
import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/auth/presentation/pages/sign-up/register_page.dart';
import '../../src/cars/data/models/comment_params.dart';
import '../../src/cars/presentation/cars/pages/cars_page.dart';
import '../../src/cars/presentation/cars/pages/sort_by/sort_by_page.dart';
import '../../src/cars/presentation/cars_details/pages/cars_details_page.dart';
import '../../src/cars/presentation/cars_search/pages/cars_search_page.dart';
import '../../src/cars/presentation/comments/pages/comments_page.dart';
import '../../src/favorites_and_ads/presentation/favorites_tabs.dart';
import '../../src/filter/presentation/pages/filter_page.dart';
import '../../src/home/presentation/pages/brands/brands_screen.dart';
import '../../src/home/presentation/pages/home/home_page.dart';
import '../../src/home/presentation/pages/home/sections_screen.dart';
import '../../src/installment/presentation/pages/installment_page.dart';
import '../../src/installment/presentation/pages/monthly_installment/monthly_installment_page.dart';
import '../../src/notifications/presentation/pages/notifications_page.dart';
import '../../src/on_boarding/pages/onboarding_page.dart';
import '../../src/plates/presentation/add_plate/pages/add_plate_page.dart';
import '../../src/plates/presentation/plate_details/pages/plates_details_page.dart';
import '../../src/plates/presentation/plates/pages/ad_premium_page.dart';
import '../../src/plates/presentation/plates/pages/plates_page.dart';
import '../../src/profile/presentation/pages/edit_profile_page.dart';
import '../../src/profile/presentation/pages/profile_page.dart';
import '../../src/real_estate/presentation/pages/real_estate_page.dart';
import '../../src/sell_car/presentation/pages/sell_car_first_page.dart';
import '../../src/sell_car/presentation/pages/sell_car_image_picker_page.dart';
import '../../src/sell_car/presentation/pages/sell_car_properties_page.dart';
import '../../src/sell_car/presentation/pages/sell_car_second_page.dart';
import '../../src/settings/presentation/pages/about_us/about_us_page.dart';
import '../../src/settings/presentation/pages/change-language/chang_language_page.dart';
import '../../src/settings/presentation/pages/settings_page.dart';
import '../../src/showrooms/presentation/branches/add_branch/pages/add_branch_page.dart';
import '../../src/showrooms/presentation/branches/pages/branches_page.dart';
import '../../src/showrooms/presentation/showroom_details/pages/showroom_details_page.dart';
import '../../src/showrooms/presentation/showrooms/pages/followed_showrooms_page.dart';
import '../../src/showrooms/presentation/showrooms/pages/showrooms_page.dart';
import '../../src/showrooms/presentation/showrooms_and_branches_tabs.dart';

class Routes {
  static const String languagePage = 'language_page';
  static const String intro = '/';
  static const String login = 'loginUI';
  static const String register = 'registerPage';
  static const String platesPage = 'PlatesPage';
  static const String platesDetailsPage = 'PlatesDetailsPage';
  static const String plateFilterPage = 'plateFilterPage';
  static const String installmentPage = 'installmentPage';
  static const String favoritesAndAdsTabs = 'favoritesAndAdsTabs';
  static const String sectionsScreen = 'sectionsScreen';
  static const String monthlyInstallmentPage = 'monthlyInstallmentPage';
  static const String realEstatePage = 'realEstatePage';
  static const String addPremiumPage = 'AddPremiumPage';
  static const String branchesPage = 'branchesPage';
  static const String addBranchPage = 'addBranchPage';
  static const String commentsPage = 'commentsPage';
  static const String followedShowroomsPage = 'FollowedShowroomsPage';

  ////////////////////////////////////////////////////////
  static const String profilePage = 'profilePage';
  static const String editProfilePage = 'editProfilePage';
  static const String notificationsPage = 'notificationsPage';
  static const String homePage = 'homePage';
  static const String onBoardingPage = 'onBoardingPage';
  static const String sellCarPage = 'sellCarPage';
  static const String sellCarSecondPage = 'sellCarSecondPage';
  static const String sellCarImagePickerPage = 'sellCarImagePickerPage';
  static const String sellCarPropertiesPage = 'sellCarPropertiesPage';
  static const String favoritesAndAdsPage = 'favoritesAndAdsPage';
  static const String brandsPage = 'brandsPage';
  static const String filterPage = 'filterPage';
  static const String sortByPage = 'sortByPage';

  static const String enterPhoneNumberPage = 'enterPhoneNumberPage';
  static const String enterPinCodePage = 'enterPinCodePage';
  static const String newPasswordPage = 'newPasswordPage';
  static const String navigationPages = 'navigationPages';
  static const String carsPage = 'carsPage';
  static const String carDetailsPage = 'carDetailsPage';
  static const String shipmentsTabsPage = 'shipmentsTabsPage';
  static const String shipmentDetails = 'shipmentDetails';
  static const String support = 'support';
  static const String operations = 'operations';
  static const String wallet = 'wallet';
  static const String complaints = 'complaints';
  static const String settings = 'settings';
  static const String changeLanguage = 'changeLanguagePage';
  static const String aboutUs = 'aboutLogestePage';
  static const String qrCodePage = 'QrCodePage';
  static const String complaintsDetailsPage = 'complaintsDetailsPage';
  static const String addComplaintPage = 'addComplaintPage';
  static const String captainsPage = 'captainsPage';
  static const String shipmentsCaptainTabsPage = 'shipmentsCaptainTabsPage';

  /* ============================================== */
  static const String showroomsPage = 'showroomsPage';
  static const String exhibitionDetailsPage = 'exhibitionDetailsPage';
  static const String carsSearchPage = 'carsSearchPage';
  static const String showroomsAndBranchesTabs = 'showroomsAndBranchesTabs';

  static final routes = <String, Widget Function(BuildContext)>{
    navigationPages: (context) => NavigationPages(),
    login: (context) => LoginPage(),
    platesPage: (context) => PlatesPage(),
    platesDetailsPage: (context) => PlatesDetailsPage(),
    plateFilterPage: (context) => AddPlatesPage(),
    installmentPage: (context) => InstallmentPage(),
    favoritesAndAdsTabs: (context) => FavoritesAndAdsTabs(),
    sectionsScreen: (context) => SectionsScreen(),
    monthlyInstallmentPage: (context) => MonthlyInstallmentPage(),
    realEstatePage: (context) => RealEstatePage(),
    addPremiumPage: (context) => AddPremiumPage(),
    branchesPage: (context) => BranchesPage(),
    addBranchPage: (context) => AddBranchPage(),
    commentsPage: (context) => CommentsPage(params: CommentParams()),
    followedShowroomsPage: (context) => FollowedShowroomsPage(),

    ////////////////////////////////
    register: (context) => RegisterPage(),
    profilePage: (context) => ProfilePage(),
    editProfilePage: (context) => EditProfilePage(),
    notificationsPage: (context) => NotificationsPage(),
    homePage: (context) => HomePage(),
    carsPage: (context) => CarsPage(),
    onBoardingPage: (context) => OnBoardingPage(),
    sellCarPage: (context) => SellCarFirstPage(),
    sellCarSecondPage: (context) => SellCarSecondPage(),
    sellCarImagePickerPage: (context) => SellCarImagePickerPage(),
    sellCarPropertiesPage: (context) => SellCarPropertiesPage(),
    favoritesAndAdsPage: (context) => FavoritesAndAdsTabs(),
    brandsPage: (context) => BrandsScreen(),
    filterPage: (context) => FilterPage(),
    sortByPage: (context) => SortByPage(),

    enterPhoneNumberPage: (context) => EnterPhoneNumberPage(),
    enterPinCodePage: (context) => EnterPinCodePage(),
    newPasswordPage: (context) => NewPasswordPage(),
    carDetailsPage: (context) => CarsDetailsPage(),
    settings: (context) => SettingsPage(),
    changeLanguage: (context) => ChangLanguagePage(),
    aboutUs: (context) => AboutUsPage(),
    showroomsPage: (context) => ShowroomsPage(),
    exhibitionDetailsPage: (context) => ShowroomDetailsPage(),
    carsSearchPage: (context) => CarsSearchPage(),
    showroomsAndBranchesTabs: (context) => ShowroomsAndBranchesTabs(),
  };
}
