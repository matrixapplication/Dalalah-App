
import '../../../../core/utils/helper_methods.dart';
import '../../../main_index.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../src/urwaypayment.dart';

class PaymentRequests{

  // ur way payment request
  static urWayPayment({required String id, required String amount}) async {
    try {
      ProfileDto? profile = await HelperMethods.getProfile();
      print('=================================================');
      final data = await Payment.makepaymentService(
          context: injector<ServicesLocator>().navigatorKey.currentContext!,
          country: "SA",
          trackid: "${profile?.id ?? '0'}$id${DateTime.now().millisecondsSinceEpoch}",
          currency: "SAR",
          action: "1",
          amt: amount,
          customerEmail: (profile!.email != null && profile.email!.isNotEmpty) ?  profile.email!  : "noemail@no.no",
          udf1: "",
          udf2: "",
          udf3: "",
          udf4: "",
          udf5: "",
          cardToken: "",
          address: (profile.city?.cityPayment != null && profile.city!.cityPayment!.isNotEmpty) ? profile.city!.cityPayment! : "no address",
          city: (profile.city?.cityPayment != null && profile.city!.cityPayment!.isNotEmpty) ? profile.city!.cityPayment! : "no city",
          state: "Pending",
          tokenizationType: "1",
          zipCode: "",
          tokenOperation: "A/U/D", metadata:"",
      );
      print('=================================================');


      print('Resultteest in Main is $data');
      return data;
    } on Exception catch (e) {
      print('Error in platform $e');
      rethrow;
    }
  }
}