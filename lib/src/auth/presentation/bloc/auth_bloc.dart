import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/notification_service.dart';
import '../../../profile/domain/use_cases/profile_usecase.dart';
import '../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/send_otp_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../../data/models/verify_otp_params.dart';
import '../../domain/use_cases/auth_usecase.dart';

@Injectable()
class AuthCubit extends BaseCubit {
  final AuthUseCase usecase;
  final ProfileUseCase profileUseCase;
  final SellCarUseCase sellCarUseCase;

  AuthCubit(this.usecase, this.sellCarUseCase, this.profileUseCase);

  Future<void> login(LoginParams params) async {
    emit(LoadingStateListener());
    params.fcmToken = await FirebaseNotification().getToken() ?? '';
    executeEmitterSuccess(() => usecase.loginAsUser(params));
  }

  Future<void> showRoomLogin(ShowroomLoginParams params) async {
    emit(LoadingStateListener());
    params.fcmToken = await FirebaseNotification().getToken() ?? '';
    executeEmitterSuccess(() => usecase.loginAsShowroom(params));
  }

  void register(RegisterParams params) {
    executeEmitterSuccess(() => usecase.register(params));
  }

  void registerAsShowroom(RegisterParams params) {
    executeEmitterListener(() => usecase.registerAsShowroom(params));
  }

  void fetchCities() {
    executeSuccessNotLoading(() => sellCarUseCase.fetchCities());
  }

  void sendOtp(SendOTPParams params) async {
    executeEmitterListener(() => usecase.sendOtp(params));
  }

  void verifyOtp(VerifyOTPParams params) async {
    executeEmitterListener(() => usecase.verifyOtp(params));
  }

  void fetchProfileDataFromCash() {
    executeSuccess(() => profileUseCase.fetchProfileDataFromCash());
  }
}
