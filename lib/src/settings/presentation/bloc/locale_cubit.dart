import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper_methods.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocalState> {
  LocaleCubit() : super(LocalState()) {
    getLanguageData();
  }

  String lang = 'ar';


  Future setLanguageData(String value) async {
    lang = value;
    await HelperMethods.setLanguage(value);
    emit(LocalState(language: lang, isLoading: false, isFirstTime: false));
  }

  Future getLanguageData() async {
    final String language = await HelperMethods.getLanguage();
    final bool isFirstTime = await HelperMethods.isFirstTime();
    print('isFirstTime $isFirstTime');
    lang = language;
    emit(LocalState(language: language, isFirstTime: isFirstTime, isLoading: false));
  }
}
