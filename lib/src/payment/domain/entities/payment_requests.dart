import 'package:urwaypayment/urwaypayment.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../main_index.dart';
import '../../../profile/data/models/profile_dto.dart';

class PaymentRequests{

  // ur way payment request
  static urWayPayment({required String id, required String amount}) async {
    ProfileDto? profile = await HelperMethods.getProfile();
    return await Payment.makepaymentService(
        context: injector<ServicesLocator>().navigatorKey.currentContext!,
        country: "SA",
        trackid:
        "${profile?.id ?? '0'}$id${DateTime.now().millisecondsSinceEpoch}",
        currency: "SAR",
        action: "1",
        amt: amount,
        customerEmail: profile?.email ?? "noemail@no.no",
        udf1: "",
        udf2: "",
        udf3: "",
        udf4: "",
        udf5: "",
        cardToken: "",
        address: profile?.city?.name ?? "",
        city: profile?.city?.name ?? "",
        state: "Pending",
        tokenizationType: "1",
        zipCode: "",
        tokenOperation: "A/U/D",
        metadata: "");
  }
}