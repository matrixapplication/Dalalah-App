
import '../entities/real_estate.dart';

abstract class BaseRealEstateRepo {
  Future<List<Notifications>> fetchNotifications();
}
