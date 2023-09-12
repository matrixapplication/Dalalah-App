import 'package:arabitac/src/main_index.dart';


const String fontBold = 'Regular';
const String fontRegular = 'Regular';


const Color primaryColor = Color(0xff022332);
const Color lighterDarkColor = Color(0xff252525);
const kGreyColor = Color(0xff989898);

final lightTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,

  primaryColorDark: const Color(0xff010C11),
  scaffoldBackgroundColor: const Color(0xffFCFCFC),
  hintColor: const Color(0xffF4F4F4),
  disabledColor: const Color(0xff8F9BB3),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0xffEDF1F7),
  iconTheme: const IconThemeData(
    color: kYellowColor,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
 //   primaryColorDark: const Color(0xFF232323),
    backgroundColor: const  Color(0xffffffff),
    accentColor: const Color(0xff494949),
    errorColor: const Color(0xffF25E02),
  ).copyWith(
    secondaryContainer: const Color(0xffF4F4F4),
      errorContainer: kErrorColor,
    onBackground: kBlueColor,
    onSurface: kBorderColor,
    onSecondary: const Color(0xff707070).withOpacity(0.14),
    secondary: const Color(0xff022332),
    onError: kRedColorEB,
    surface: const Color(0xffFFA010),
     tertiaryContainer: const Color(0xff0095FF),
    outline: const Color(0xffD6D6D6),
    outlineVariant: const Color(0xff494949),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    foregroundColor: primaryColor,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
      color: const Color(0xff000000),
    ),
    backgroundColor: Color(0xffffffff),
    centerTitle: true,
    elevation: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xffffffff),
    hintStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'ProductSans-Regular',
    ),
  ),
  fontFamily: fontBold,
  textTheme:  const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontFamily: fontRegular,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontFamily: fontRegular,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      color: kGreyColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: kGreyColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: kGreyColor,
      fontFamily: fontRegular,
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: fontRegular,
      letterSpacing: 1.0,
      wordSpacing: 0.0,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: primaryColor,
      fontFamily: fontRegular,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      color: primaryColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      color: primaryColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),

  ),
);