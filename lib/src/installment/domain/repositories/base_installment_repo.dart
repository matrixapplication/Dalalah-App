
import 'dart:io';

import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/register_params.dart';
import '../../data/models/profile_dto.dart';
import '../entities/profile.dart';



abstract class BaseInstallmentRepo<T>{
  Future<String> fetchInstallment();
}
