import 'package:flutter/cupertino.dart';

import '../../navigation_pages.dart';
import '../../src/auth/presentation/pages/forget-password/enter_phone_number_page.dart';
import '../../src/auth/presentation/pages/forget-password/enter_pin_code_page.dart';
import '../../src/auth/presentation/pages/forget-password/new_password_page.dart';
import '../../src/auth/presentation/pages/verify-account/send_otp_page.dart';
import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/auth/presentation/pages/sign-up/register_page.dart';
import '../../src/auth/presentation/pages/verify-account/verify_account_page.dart';
import '../../src/cars/data/models/comment_params.dart';
import '../../src/cars/presentation/cars/pages/cars_page.dart';
import '../../src/cars/presentation/cars/pages/sort_by/sort_by_page.dart';
import '../../src/cars/presentation/cars_details/pages/cars_details_page.dart';
import '../../src/cars/presentation/cars_search/pages/cars_search_page.dart';
import '../../src/cars/presentation/comments/pages/comments_page.dart';
import '../../src/favorites_and_ads/presentation/favorites_tabs.dart';
import '../../src/favorites_and_ads/presentation/my_ads/pages/add_premium_ad_page.dart';
import '../../src/home/presentation/pages/home_page.dart';
import '../../src/add__ads/pages/sections_screen.dart';
import '../../src/installment/presentation/pages/installment_page.dart';
import '../../src/installment/presentation/pages/monthly_installment/monthly_installment_page.dart';
import '../../src/notifications/presentation/pages/notifications_page.dart';
import '../../src/on_boarding/pages/onboarding_page.dart';
import '../../src/payment/presentation/pages/payment_page.dart';
import '../../src/plates/presentation/add_plate/pages/add_plate_page.dart';
import '../../src/plates/presentation/add_plate/pages/plate_premium_page.dart';
import '../../src/plates/presentation/plate_details/pages/plates_details_page.dart';
import '../../src/price_requests/presentation/pages/price_requests_page.dart';
import '../../src/sell_car/presentation/pages/ad_car_premium_page.dart';
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
import '../../src/settings/support/pages/support_page.dart';
import '../../src/showrooms/presentation/branches/add_branch/pages/add_branch_page.dart';
import '../../src/showrooms/presentation/branches/pages/branches_page.dart';
import '../../src/showrooms/presentation/showroom_details/pages/showroom_details_page.dart';
import '../../src/showrooms/presentation/showrooms/pages/followed_showrooms_page.dart';
import '../../src/showrooms/presentation/showrooms/pages/showrooms_page.dart';
import '../../src/showrooms/presentation/showrooms_and_branches_tabs.dart';
import 'app_links_service.dart';

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
  static const String addCarPremiumPage = 'addCarPremiumPage';
  static const String addPlatePremiumPage = 'addPlatePremiumPage';
  static const String branchesPage = 'branchesPage';
  static const String addBranchPage = 'addBranchPage';
  static const String commentsPage = 'commentsPage';
  static const String followedShowroomsPage = 'FollowedShowroomsPage';
  static const String supportPage = 'supportPage';
  static const String addPremiumADPage = 'addPremiumADPage';
  static const String priceRequestsPage = 'priceRequestsPage';
  static const String sendOTPPage = 'sendOTPPage';
  static const String verifyAccountPage = 'verifyAccountPage';

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
  static const String paymentPage = 'paymentPage';

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
  static const String settingsPage = 'settings';
  static const String changeLanguage = 'changeLanguagePage';
  static const String aboutUs = 'aboutLogestePage';
  static const String qrCodePage = 'QrCodePage';
  static const String complaintsDetailsPage = 'complaintsDetailsPage';
  static const String addComplaintPage = 'addComplaintPage';
  static const String captainsPage = 'captainsPage';
  static const String shipmentsCaptainTabsPage = 'shipmentsCaptainTabsPage';

  /* ============================================== */
  static const String showroomsPage = 'showroomsPage';
  static const String showroomDetailsPage = 'exhibitionDetailsPage';
  static const String carsSearchPage = 'carsSearchPage';
  static const String showroomsAndBranchesTabs = 'showroomsAndBranchesTabs';
  static const String carAppLink = 'car';
  static const String plateAppLink = 'plate';


  static routes(BuildContext context) => {
    '/{id}' : (context) => NavigationPages(),
    'ar' : (context) => NavigationPages(),
    'en' : (context) => NavigationPages(),
    carAppLink : (context) => CarsDetailsPage(),
    plateAppLink : (context) => PlateDetailsPage(),
    navigationPages: (context) => NavigationPages(),
    login: (context) => LoginPage(),
    platesPage: (context) => PlatesPage(),
    platesDetailsPage: (context) => PlateDetailsPage(),
    plateFilterPage: (context) => AddOrPlatesPage(),
    installmentPage: (context) => InstallmentPage(),
    favoritesAndAdsTabs: (context) => FavoritesAndAdsTabs(),
    sectionsScreen: (context) => AddYourAdPage(),
    monthlyInstallmentPage: (context) => MonthlyInstallmentPage(),
    realEstatePage: (context) => RealEstatePage(),
    addCarPremiumPage: (context) => CarPremiumPage(),
    addPlatePremiumPage: (context) => PlatePremiumPage(),
    branchesPage: (context) => BranchesPage(),
    addBranchPage: (context) => AddBranchPage(),
    commentsPage: (context) => CommentsPage(params: CommentParams()),
    followedShowroomsPage: (context) => FollowedShowroomsPage(),
    addPremiumADPage: (context) => AddPremiumADPage(),
    priceRequestsPage: (context) => PriceRequestsPage(),
    sendOTPPage: (context) => SendOTPPage(),
    verifyAccountPage: (context) => VerifyAccountPage(),

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
    sortByPage: (context) => SortByPage(),
    paymentPage: (context) => PaymentPage(),

    enterPhoneNumberPage: (context) => EnterPhoneNumberPage(),
    enterPinCodePage: (context) => EnterPinCodePage(),
    newPasswordPage: (context) => NewPasswordPage(),
    carDetailsPage: (context) => CarsDetailsPage(),
    settingsPage: (context) => SettingsPage(),
    changeLanguage: (context) => ChangLanguagePage(),
    aboutUs: (context) => AboutUsPage(),
    showroomsPage: (context) => ShowroomsPage(),
    showroomDetailsPage: (context) => ShowroomDetailsPage(),
    carsSearchPage: (context) => CarsSearchPage(),
    showroomsAndBranchesTabs: (context) => ShowroomsAndBranchesTabs(),
    supportPage: (context) => SupportPage(),
  };

  static onGenerateRoute(RouteSettings settings) {
    print('settings.name ${settings.name}');
    // String route = settings.name ?? '';
    //   route.contains('/') ? route = route.split('/')[1] : route = route;
    //   print('onGenerateRoute $route');
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => NavigationPages());
      case 'ar':
        return CupertinoPageRoute(builder: (_) => NavigationPages());
      case 'en':
        return CupertinoPageRoute(builder: (_) => NavigationPages());
      // case carAppLink:
      //   return pushNamed(carAppLink, arguments: 36);
      case plateAppLink:
        return CupertinoPageRoute(builder: (_) => PlateDetailsPage());
    //   case navigationPages:
    //     return CupertinoPageRoute(builder: (_) => NavigationPages());
    //   case login:
    //     return CupertinoPageRoute(builder: (_) => LoginPage());
    //   case platesPage:
    //     return CupertinoPageRoute(builder: (_) => PlatesPage());
    //   case platesDetailsPage:
    //     return CupertinoPageRoute(builder: (_) => PlatesDetailsPage());
    //   case plateFilterPage:
    //     return CupertinoPageRoute(builder: (_) => AddPlatesPage());
    //   case installmentPage:
    //     return CupertinoPageRoute(builder: (_) => InstallmentPage());
    //   case favoritesAndAdsTabs:
    //     return CupertinoPageRoute(builder: (_) => FavoritesAndAdsTabs());
    //   case sectionsScreen:
    //     return CupertinoPageRoute(builder: (_) => AddYourAdPage());
    //   case monthlyInstallmentPage:
    //     return CupertinoPageRoute(builder: (_) => MonthlyInstallmentPage());
    //   case realEstatePage:
    //     return CupertinoPageRoute(builder: (_) => RealEstatePage());
    //   case addCarPremiumPage:
    //     return CupertinoPageRoute(builder: (_) => CarPremiumPage());
    //   case addPlatePremiumPage:
    //     return CupertinoPageRoute(builder: (_) => PlatePremiumPage());
    //   case branchesPage:
    //     return CupertinoPageRoute(builder: (_) => BranchesPage());
    //   case addBranchPage:
    //     return CupertinoPageRoute(builder: (_) => AddBranchPage());
    //   case commentsPage:
    //     return CupertinoPageRoute(
    //         builder: (_) => CommentsPage(params: CommentParams()));
    //   case followedShowroomsPage:
    //     return CupertinoPageRoute(builder: (_) => FollowedShowroomsPage());
    //
    // ////////////////////////////////
    //   case register:
    //     return CupertinoPageRoute(builder: (_) => RegisterPage());
    //   case profilePage:
    //     return CupertinoPageRoute(builder: (_) => ProfilePage());
    //   case editProfilePage:
    //     return CupertinoPageRoute(builder: (_) => EditProfilePage());
    //   case notificationsPage:
    //     return CupertinoPageRoute(builder: (_) => NotificationsPage());
    //   case homePage:
    //     return CupertinoPageRoute(builder: (_) => HomePage());
    //   case carsPage:
    //     return CupertinoPageRoute(builder: (_) => CarsPage());
    //   case onBoardingPage:
    //     return CupertinoPageRoute(builder: (_) => OnBoardingPage());
    //   case sellCarPage:
    //     return CupertinoPageRoute(builder: (_) => SellCarFirstPage());
    //
    //
    //   case sellCarSecondPage:
    //     return CupertinoPageRoute(builder: (_) => SellCarSecondPage());
    //   case sellCarImagePickerPage:
    //     return CupertinoPageRoute(builder: (_) => SellCarImagePickerPage());
    //   case sellCarPropertiesPage:
    //     return CupertinoPageRoute(builder: (_) => SellCarPropertiesPage());
    //   case favoritesAndAdsPage:
    //     return CupertinoPageRoute(builder: (_) => FavoritesAndAdsTabs());
    //   case filterPage:
    //     return CupertinoPageRoute(builder: (_) => FilterPage());
    //   case sortByPage:
    //     return CupertinoPageRoute(builder: (_) => SortByPage());
    //   case paymentPage:
    //     return CupertinoPageRoute(builder: (_) => PaymentPage());
    //
    //   case enterPhoneNumberPage:
    //     return CupertinoPageRoute(builder: (_) => EnterPhoneNumberPage());
    //   case enterPinCodePage:
    //     return CupertinoPageRoute(builder: (_) => EnterPinCodePage());
    //   case newPasswordPage:
    //     return CupertinoPageRoute(builder: (_) => NewPasswordPage());
    //   case carDetailsPage:
    //     return CupertinoPageRoute(builder: (_) => CarsDetailsPage());
    //   case settingsPage:
    //     return CupertinoPageRoute(builder: (_) => SettingsPage());
    //   case changeLanguage:
    //     return CupertinoPageRoute(builder: (_) => ChangLanguagePage());
    //   case aboutUs:
    //     return CupertinoPageRoute(builder: (_) => AboutUsPage());
    //   case showroomsPage:
    //     return CupertinoPageRoute(builder: (_) => ShowroomsPage());
    //   case showroomDetailsPage:
    //     return CupertinoPageRoute(builder: (_) => ShowroomDetailsPage());
    //   case carsSearchPage:
    //     return CupertinoPageRoute(builder: (_) => CarsSearchPage());
    //   case showroomsAndBranchesTabs:
    //     return CupertinoPageRoute(builder: (_) => ShowroomsAndBranchesTabs());
    //   case supportPage:
    //     return CupertinoPageRoute(builder: (_) => SupportPage());
      // default:
      //   return CupertinoPageRoute(builder: (_) => NavigationPages());
    }}
}
