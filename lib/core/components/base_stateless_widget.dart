
import '../widgets/dialogs/progress_dialog.dart';
import '/src/main_index.dart';
abstract class BaseStatelessWidget extends StatelessWidget {

  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;
  final strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings ;
  ThemeData get theme => Theme.of(context!);
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
