import 'package:injectable/injectable.dart';

import '../entities/invoice.dart';
import '../repositories/base_filter_repo.dart';

@Injectable()
class FilterUseCase {
  final BaseFilterRepo repository ;
  FilterUseCase(this.repository);

  Future<List<Invoice>> fetchInvoices() async {
    // final invoices = await repository.fetchInvoices();
    // return invoices;
    return [
      Invoice(
        id: 1,
        date: 'الاربعاء 25/1/2022',
       details: [
         InvoiceDetails(
           title: 'فاتورة الشهر الاول',
           pdf: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
           download: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
         ),
         InvoiceDetails(
           title: 'فاتورة الشهر الاول',
           pdf: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
           download: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
         ),
         InvoiceDetails(
           title: 'فاتورة الشهر الاول',
           pdf: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
           download: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
         ),
       ]
      ),
    ];
  }
}