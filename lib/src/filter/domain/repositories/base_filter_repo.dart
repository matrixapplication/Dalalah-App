


import '../entities/invoice.dart';

abstract class BaseFilterRepo {
  Future<List<Invoice>> fetchInvoices();
}
