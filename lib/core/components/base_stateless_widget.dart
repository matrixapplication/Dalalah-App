
import '../../main.dart';
import '../widgets/dialogs/progress_dialog.dart';
import '/src/main_index.dart';
abstract class BaseStatelessWidget extends StatelessWidget {

  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;

  final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings;
  ThemeData get theme => Theme.of(context!);
  TextStyle get labelSmall => context!.labelSmall;
  TextStyle get labelMedium => context!.labelMedium;
  TextStyle get labelLarge => context!.labelLarge;
  TextStyle get displaySmall => context!.displaySmall;
  TextStyle get displayMedium => context!.displayMedium;
  TextStyle get displayLarge => context!.displayLarge;
  TextStyle get headlineSmall => context!.headlineSmall;
  TextStyle get headlineMedium => context!.headlineMedium;
  TextStyle get headlineLarge => context!.headlineLarge;
  TextStyle get bodySmall => context!.bodySmall;
  TextStyle get bodyMedium => context!.bodyMedium;
  TextStyle get bodyLarge => context!.bodyLarge;
  TextStyle get titleSmall => context!.titleSmall;
  TextStyle get titleMedium => context!.titleMedium;
  TextStyle get titleLarge => context!.titleLarge;
  Color get primaryColor => theme.primaryColor;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  final local = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString();

  //static String routeName (){return '';}

  final CustomProgressDialog progress =
  DialogsManager.createProgress();

  bool isRtl() => local == 'ar';

  BaseStatelessWidget({Key? key}):  super(key: key);


  T? getArguments<T>(BuildContext context ){
    return context?.getArguments();
  }

  handleErrorDialogBuilder(dynamic exception) {
    final context = this.context ;

    DialogsManager. showErrorDialog(context!, exception);

  }

}
