
import 'package:urwaypayment/urwaypayment.dart';

import '../../../main_index.dart';
import '../../domain/entities/package.dart';

class PaymentScreen extends BaseStatelessWidget {
  final List<Package> packages;
  final Function(Package) onFetchInstallmentValue;

  PaymentScreen(
      {super.key,
      required this.packages,
      required this.onFetchInstallmentValue});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: packages.length,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        final package = packages[index];
        return Padding(
          padding: 10.paddingBottom,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: context.primaryColor,
                width: 1,
              ),
            ),
            title: Text(' ${package.name}', style: bodyLarge),
            subtitle: Text(' ${package.description}', style: displaySmall),
            trailing: Text('${package.price}\n${strings.rs}', style: headlineLarge, textAlign: TextAlign.center),
            onTap: () {
              onFetchInstallmentValue(package);
            },
          ),
        );
      },
    );
  }
  Future<void> makePayment() async {

    // To store payment data
    dynamic lastResult;


    try {

      // initiate payment
      lastResult = await Payment.makepaymentService(context: context!,
          country: "SA",
          action: "1",
          currency: "SAR",
          amt: "1.00",
          customerEmail: "john.deo@gmail.com",
          trackid: "111AAA",
          udf1: "",
          udf2: "",
          udf3: "",
          udf4: "",
          udf5: "",
          cardToken: "",
          address: "ABC",
          city: "PQR",
          state: "XYZ",
          tokenizationType: "1",
          zipCode: "",
          tokenOperation: "A/U/D", metadata:"" );


      print('Result in Main is $lastResult');

    } on PlatformException {
      print('Failed payment');
    }
  }
}
