
import 'package:arabitac/data/datasource/remote/exception/error_widget.dart';
import 'package:arabitac/features/auth_features/feature_data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AppRepository {
  //* Auth
  Future<Either<ErrorModel, UserModel>> getProfile();
}
