
import 'package:injectable/injectable.dart';

import '../../domain/entities/invoice.dart';
import '../../domain/repositories/base_filter_repo.dart';
import '../data_sources/filter_datasource.dart';


@Injectable(as: BaseFilterRepo)
class FilterRepo extends BaseFilterRepo{
  final FilterDatasource  datasource;
  FilterRepo(this.datasource);

  @override
  Future<List<Invoice>> fetchInvoices() async {
    final invoices = await datasource.fetchInvoices();
    return invoices.data!;
  }

}