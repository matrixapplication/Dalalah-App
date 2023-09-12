import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/models/forgot_password_params.dart';
import '../../domain/use_cases/forgot_password_usecase.dart';

@Injectable()
class ForgotPasswordCubit extends BaseCubit {
  final ForgotPasswordUseCase usecase;

  ForgotPasswordCubit(this.usecase);


  enterPhoneNumber(String phoneNumber) async {
    emit(DataLoading());
    try {
      final response = await usecase.enterPhoneNumber(phoneNumber);
      emit(DataSuccess(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }
  enterPinCode(String code) async {
    emit(DataLoading());
    try {
      final response = await usecase.enterPinCode(code);
      emit(DataSuccess(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }



  forgotPassword(ForgotPasswordParams params) async {
    emit(DataLoading());
    try {
      final response = await usecase.forgotPassword(params);
      emit(DataSuccess(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }


}
