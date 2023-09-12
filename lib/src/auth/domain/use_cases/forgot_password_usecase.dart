import 'package:injectable/injectable.dart';

import '../../data/models/forgot_password_params.dart';
import '../repositories/base_forgot_password_repo.dart';

@Injectable()
class ForgotPasswordUseCase {
  final BaseForgotPasswordRepo repository ;
  ForgotPasswordUseCase(this.repository);

  Future<String> enterPhoneNumber(String phoneNumber) {
    return repository.enterPhoneNumber(phoneNumber);
  }

  Future<String> enterPinCode(String code) {
    return repository.enterCode(code);
  }

  Future<String> forgotPassword(ForgotPasswordParams params) {
    return repository.forgotPassword(params);
  }

}