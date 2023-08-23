import 'dart:async';


import 'package:arabitac/core/base/base_response.dart';
import 'package:arabitac/core/services/network/network_client.dart';
import 'package:arabitac/data/app_urls/app_url.dart';
import 'package:arabitac/data/datasource/remote/exception/error_widget.dart';
import 'package:arabitac/features/auth_features/feature_data/model/user_model.dart';
import 'package:arabitac/features/auth_features/feature_domain/repositoy/app_repo.dart';

import 'package:dartz/dartz.dart';


class AppRepositoryImp implements AppRepository {
  final NetworkClient networkClient;
  AppRepositoryImp({required this.networkClient});

  @override
  Future<Either<ErrorModel, UserModel>> getProfile() async {
    String url = AppURL.profile;
    NetworkCallType type = NetworkCallType.get;
    Map<String, dynamic> data = {};
    Either<ErrorModel, BaseResponse> result = await networkClient(url: url, data: data, type: type);
    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);
        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }
}
