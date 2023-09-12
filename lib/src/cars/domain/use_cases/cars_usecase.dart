import 'package:injectable/injectable.dart';

import '../../data/models/pick_up_params.dart';
import '../entities/material_packaging.dart';
import '../entities/returner.dart';
import '../entities/tasks.dart';
import '../repositories/base_cars_repo.dart';

@Injectable()
class CarsUseCase {
  final BaseCarsRepo repository;

  CarsUseCase(this.repository);

  Future<List<Task>> fetchTasks() async {
    // return await repository.fetchTasks();
    return [
      Task(
        id: 1,
        name: 'شادى محمد عبدالسلام',
        address: 'العنوان',
        description: 'بيك أب > كاش > إعادة مال',
        date: 'Mon Mar 28 2022 13:17:16',
        phone: '+201141475581',
        status: 'قيد التقدم',
        shipmentNumber: '156464613',
      ),
      Task(
        id: 1,
        name: 'شادى محمد عبدالسلام',
        address: 'العنوان',
        description: 'بيك أب > كاش > إعادة مال',
        date: 'Mon Mar 28 2022 13:17:16',
        phone: '+201141475581',
        status: 'قيد التقدم',
        shipmentNumber: '156464613',
      ),
      Task(
        id: 1,
        name: 'شادى محمد عبدالسلام',
        address: 'العنوان',
        description: 'بيك أب > كاش > إعادة مال',
        date: 'Mon Mar 28 2022 13:17:16',
        phone: '+201141475581',
        status: 'قيد التقدم',
        shipmentNumber: '156464613',
      ),
      Task(
        id: 1,
        name: 'شادى محمد عبدالسلام',
        address: 'العنوان',
        description: 'بيك أب > كاش > إعادة مال',
        date: 'Mon Mar 28 2022 13:17:16',
        phone: '+201141475581',
        status: 'قيد التقدم',
        shipmentNumber: '156464613',
      ),
    ];
  }

  Future<String> collectionWithoutBarcode(PickUpParams params) async {
    return await repository.collectionWithoutBarcode(params);
  }

  Future<String> collectByBarcode(PickUpParams params) async {
    return await repository.collectByBarcode(params);
  }

  Future<String> deliveryCollection() async {
    return await repository.deliveryCollection();
  }

  Future<String> rejectCollection() async {
    return await repository.rejectCollection();
  }

  Future<String> confirmCollectionProcess(String number) async {
    return await repository.confirmCollectionProcess(number);
  }

  Future<List<Returner>> fetchReturnerShipments() async {
    // final data = await repository.fetchReturnerShipments();
    // return data.map((e) => Returner.fromJson(e)).toList();
    return [
      Returner(
        serial: '5454545',
        shipments: 45,
      ),
      Returner(
        serial: '5454545',
        shipments: 45,
      ),
      Returner(
        serial: '5454545',
        shipments: 45,
      ),
    ];
  }

  Future<String> deliveryReturner(List<Returner> returners) async {
    return await repository.deliveryReturner(returners);
  }

  Future<String> rejectReturner(List<Returner> returners) async {
    return await repository.rejectReturner(returners);
  }

  Future<String> deliveryMaterial(List<MaterialPackaging> params) async {
    return await repository.deliveryMaterial(params);
  }

  Future<String> rejectMaterial(List<MaterialPackaging> params) async {
    return await repository.rejectMaterial(params);
  }

  Future<List<MaterialPackaging>> fetchMaterialPackaging() async {
    // final data = await repository.fetchMaterialPackaging();
    // return data.map((e) => MaterialPackaging.fromJson(e)).toList();

    return [
      MaterialPackaging(
        type: '5454545',
        count: 45,
      ),
      MaterialPackaging(
        type: '5454545',
        count: 45,
      ),
      MaterialPackaging(
        type: '5454545',
        count: 45,
      ),
    ];
  }
}
