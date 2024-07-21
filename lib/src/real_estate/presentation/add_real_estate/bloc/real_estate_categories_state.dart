import 'dart:io';

import 'package:dalalah/src/real_estate/data/models/category_details_dto.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../../../data/models/real_estate_type_dto.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';


class RealEstateCategoriesState extends DataStateFBuilder{
  final List<RealEstateCategoryDto> realEstateCategoriesList;
  final StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetailsStream;

  RealEstateCategoriesState({
    required this.realEstateCategoriesList,
    required this.categoriesDetailsStream,
  });

}
