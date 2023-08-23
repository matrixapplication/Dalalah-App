
import 'package:arabitac/core/base/base_usecase.dart';
import 'package:arabitac/data/datasource/remote/exception/error_widget.dart';
import 'package:arabitac/features/auth_features/feature_data/model/user_model.dart';

import 'package:dartz/dartz.dart';

import '../../repositoy/app_repo.dart';

class ProfileUseCase extends BaseUseCase<UserModel, NoParameters> {
  final AppRepository repository;

  ProfileUseCase({required this.repository});

  @override
  Future<Either<ErrorModel, UserModel>> call(NoParameters parameters) async {
    return await repository.getProfile();
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(NoParameters parameters) {
    throw UnimplementedError();
  }
}
