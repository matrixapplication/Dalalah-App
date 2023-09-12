class AppStrings {
  //Basic app strings.
  static String appLang = "ar";
  static String appTitle = "Logeste";

  // Splash screens texts.
  static String welcomeText = "مرحبا بك في لوجيستى";

  // static String welcomeText = "Update the left Arrow";
  static String deliveryDescription = "هنا يكتب الوصف الخاص بصفحة التوصيل";
  static String orderDescription = "هنا يكتب الوصف الخاص بصفحة الطلبات";
  static String pickDescription = "هنا يكتب الوصف الخاص بصفحة اختيار المكان";

  // Common in Login and SignUp
  static String userNameFieldHint = "الاسم";
  static String phoneFieldHint = "رقم الهاتف";
  static String emailFieldHint = "البريد الالكترونى";
  static String passwordFieldHint = "كلمة السر";
  static String agentNameFieldHint = "اسم الشركة / الوكيل";
  static String managerNameFieldHint = "اسم المسئول";

  // Login page texts.
  static String loginAppBarTitle = "مرحبا بك فى لوجيستى";
  static String loginPageTitle = "قم بتسجيل الدخول الى حسابك";
  static String loginPageTabBarTitle1 = "كَـ مندوب";
  static String loginPageTabBarTitle2 = "كَـ وكيل";
  static String loginPageForgetPassText = "هل نسيت كلمة السر ؟ ";
  static String loginPageNoAccountText = "ليس لديك حساب ؟ ";
  static String loginPageCreateAccountText = "تسجيل حساب جديد";
  static String loginPageButtonText = "تسجيل الدخول";

// SignUp page texts.
  static String signUpPageTitle = "قم بإنشاء حسابك الان";
  static String signUpPageHasAccount = "هل لديك حساب بالفعل ؟ ";
  static String signUpPageLogin = "تسجيل الدخول";
  static String signUpPageButtonText = "تسجيل الحساب";
  static String signUpNextPageButtonText = "التالى";
  static List<String> radioStrings = ["مندوب مع مركبة", "مندوب بدون مركبة"];

  static String signUpFinishingPageTitle = "قم بإستكمال حسابك كَـ مندوب";
  static String uploadImageText1 = "اضغط لرفع صورة رخصة القيادة";
  static String uploadFinishedImageText1 = "تم رفع صورة رخصة القيادة";
  static String uploadImageText2 = "اضغط لرفع صورة رخصة المركبة";
  static String uploadFinishedImageText2 = "تم رفع صورة رخصة المركبة";
  static String uploadImageText3 = "اضغط لرفع صورة البطاقة الشخصية";
  static String uploadFinishedImageText3 = "تم رفع صورة البطاقة الشخصية";
  static String uploadImageText4 = "اضغط لرفع صحيفة الأحوال الجنائية";
  static String uploadFinishedImageText4 = "تم رفع صحيفة الأحوال الجنائية";

  //Forget password page strings
  static String forgetPassAppbarTitle = "هل نسيت كلمة السر ؟";
  static String forgetPassPageButtonText = "تأكيد";

  static String enterPhonePageTitle =
      "قم بإدخال رقم الهاتف المسجل لاستعادة حسابك";

  static String enterPinCodePageTitle = "قم بإدخال الرمز لإستعادة حسابك";
  static String enterPinCodePageSubTitle =
      "تم ارسال رسالة نصية لرقم هاتفك المسجل";
  static String enterPinCodeResendText = "إعادة إرسال";

  static String newPasswordPageTitle =
      "تم استرجاع حسابك قم بتعيين كلمة سر جديدة";
  static String newPasswordFieldHint = "كلمة السر الجديدة";
  static String repeatNewPasswordFieldHint = "تأكيد كلمة السر الجديدة";
  static String passwordsNotMatches = "الكلمات غير متطابقة, قم بكتابتها جيداً";

  // Side Menu Strings.
  static String tileTitleShipments = "الشحنات";
  static String tileTitleOperations = "العمليات";
  static String tileTitleShoppingBag = "البيك أب";
  static String tileTitleBills = "الفواتير";
  static String tileTitleWallet = "المحفظة";
  static String tileTitleNotification = "الاشعارات";
  static String tileTitleQrScan = "الشكاوى";
  static String tileTitleSettings = "الاعدادات";
  static String tileTitleAboutUs = "عن لوجيستي";
  static String tileTitleLogout = "تسجيل الخروج";
  static String tileTitleCaptain = "الكباتن";

  //Home Page Strings.
  static String homePageTitle = "حالة العميل : ";
  static String homePageUserConnected = "متصل";
  static String homePageUserNotConnected = "غير متصل";
  static String homePageStopConnection = "تأكيد ايقاف الاتصال";
  static String homePageStopScanSearchButton = "Scan to Search";
  static String homePageStopScanReceiveButton = "Scan to Receive";
  static String homePageStopScanPickButton = "Scan to Pick";
  static String homePageSheetAnotherReason = "ماهو سبب تأجيل الشحنة ؟";
  static List reasons = [
    "السبب الأول",
    "السبب الثانى",
    "السبب الثالث",
    "سبب اخر",
  ];
  static String receiveSheetButtonTextPart1 = "استلام (";
  static String receiveSheetButtonTextPart2 = " شحنة)";
  static String receiveSheetSubButtonText = "اذهب الى الشحنات";
  static String receiveSheetDoneText = "تم استلام الشحنة بنجاح";
  static String pickSheetButtonTextPart1 = "التقط (";
  static String pickSheetButtonTextPart2 = " شحنة)";
  static String pickSheetSubButtonText = "اذهب الى المهام";
  static String pickSheetDoneTextPart1 = "تم التقاط عدد ";
  static String pickSheetDoneTextPart2 = " شحنة بنجاح";

  //Bottom Navigator Bar Item labels.
  static String shipmentsItemLabel = "الشحنات";
  static String tasksItemLabel = "المهام";
  static String billsItemLabel = "الفواتير";
  static String notificationsItemLabel = "الاشعارات";

  //Shipment Card Strings.
  static String shipmentDescription = "تم استعجال الشحنة";
  static String shipmentNumber = "رقم الشحنة";
  static String shipmentType = "نوع الشحنة";
  static String shipmentSender = "المرسل";
  static String shipmentMarket = "المتجر";
  static String shipmentReceiverAddress = "عنوان المستلم";
  static String shipmentNotes = "الملاحظات";
  static String shipmentCardButton = "الملاحظات";

// static String  = "";
}
