
import '../../data/models/material_packaging_dto.dart';
import '../../data/models/pick_up_params.dart';
import '../../data/models/returner_dto.dart';
import '../entities/material_packaging.dart';
import '../entities/returner.dart';
import '../entities/tasks.dart';

abstract class BaseCarsRepo {
  Future<List<Task>> fetchTasks();
  Future<String> collectionWithoutBarcode(PickUpParams params);
  Future<String> collectByBarcode(PickUpParams params);
  Future<String> deliveryCollection();
  Future<String> rejectCollection();
  Future<String> confirmCollectionProcess(String number);
  Future<List<ReturnerDto>> fetchReturnerShipments();
  Future<String> deliveryReturner(List<Returner> returners);
  Future<String> rejectReturner(List<Returner> returners);
  Future<List<MaterialPackagingDto>> fetchMaterialPackaging();
  Future<String> deliveryMaterial(List<MaterialPackaging> params);
  Future<String> rejectMaterial(List<MaterialPackaging> params);

}
