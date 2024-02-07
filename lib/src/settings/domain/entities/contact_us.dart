
import '../../data/models/contact_us_dto.dart';

class ContactUs {
  String? address;
  String? phone;
  String? email;

  ContactUs({this.address, this.phone, this.email});

   factory ContactUs.fromDto(ContactUsDto json) {
     return ContactUs(
       address: json.address,
       phone: json.phone,
       email: json.email,
     );
   }
}

