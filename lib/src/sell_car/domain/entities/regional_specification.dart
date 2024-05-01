
import 'package:dalalah/core/exceptions/extensions.dart';

import '../../../../core/di/injector.dart';
import '../../data/models/regional_specification_dto.dart';

class RegionalSpecification {
  final int? id;
  final String? name;

  RegionalSpecification ({
    this.id,
    this.name,
  });

  factory RegionalSpecification.fromDto(RegionalSpecificationDto json) {
    return RegionalSpecification(
      id: json.id,
      name: json.name,
    );
  }

  static List<RegionalSpecification>  getSpecifications(){
    final strings = injector<ServicesLocator>().appContext.strings;
    return [
      RegionalSpecification(id: 1, name: strings.saudi),
      RegionalSpecification(id: 2, name: strings.gulf),
      RegionalSpecification(id: 3, name: strings.import),
    ];
  }
}


