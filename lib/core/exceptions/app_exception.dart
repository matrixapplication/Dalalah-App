
import '../di/injector.dart';
import '../exceptions/extensions.dart';

abstract class AppBaseException implements Exception {
  String  get messageEn;
  String  get messageAr;

  @override
  String toString() {
    final  lang = injector<ServicesLocator>().navigatorKey.currentContext?.languageCode.toString() ;
    return  lang == "ar" ?messageAr : messageEn ;
  }

  String  toLocalizeMessage (){
    return '';
  }

  String toLocalize(String local) {
    return '';
  }
}
