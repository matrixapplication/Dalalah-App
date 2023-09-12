
import 'package:injectable/injectable.dart';

import '../../domain/entities/material_packaging.dart';
import '../../domain/entities/returner.dart';
import '../../domain/entities/tasks.dart';
import '../../domain/repositories/base_cars_repo.dart';
import '../data_sources/cars_datasource.dart';
import '../models/material_packaging_dto.dart';
import '../models/pick_up_params.dart';
import '../models/returner_dto.dart';


@Injectable(as: BaseCarsRepo)
class TasksRepo extends BaseCarsRepo{
  final CarsDatasource  datasource;
  TasksRepo(this.datasource);

  @override
  Future<List<Task>> fetchTasks() async {
    final data = await datasource.fetchTasks();
    return data.payload!;
  }

  @override
  Future<String> collectionWithoutBarcode(PickUpParams params) async {
    final data = await datasource.collectionWithoutBarcode(params);
    return data.payload!;
  }

  @override
  Future<String> collectByBarcode(PickUpParams params) async {
    final data = await datasource.collectByBarcode(params);
    return data.payload!;
  }

  @override
  Future<String> deliveryCollection() async {
    final data = await datasource.deliveryCollection();
    return data.payload!;
  }

  @override
  Future<String> rejectCollection() async {
    final data = await datasource.rejectCollection();
    return data.payload!;
  }

  @override
  Future<String> confirmCollectionProcess(String number) async {
    final data = await datasource.confirmCollectionProcess(number);
    return data.payload!;
  }

  @override
  Future<List<ReturnerDto>> fetchReturnerShipments() async {
    final data = await datasource.fetchReturnerShipments();
    return data.payload!;
  }

  @override
  Future<String> deliveryReturner(List<Returner> returners) async {
    final data = await datasource.deliveryReturner(returners);
    return data.payload!;
  }

  @override
  Future<String> rejectReturner(List<Returner> returners) async {
    final data = await datasource.rejectReturner(returners);
    return data.payload!;
  }

  @override
  Future<List<MaterialPackagingDto>> fetchMaterialPackaging() async {
    final data = await datasource.fetchMaterialPackaging();
    return data.payload!;
  }

  @override
  Future<String> deliveryMaterial(List<MaterialPackaging> params) async {
    final data = await datasource.deliveryMaterial(params);
    return data.payload!;
  }

  @override
  Future<String> rejectMaterial(List<MaterialPackaging> params) async {
    final data = await datasource.rejectMaterial(params);
    return data.payload!;
  }

}