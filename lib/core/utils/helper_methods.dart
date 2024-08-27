import 'dart:convert';
import 'dart:io';

import 'package:dalalah/src/profile/domain/entities/roles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../src/home/data/models/car_dto.dart';
import '../../src/home/data/models/slide_dto.dart';
import '../../src/home/domain/entities/slide.dart';
import '../../src/main_index.dart';
import '../../src/plates/data/models/plate_dto.dart';
import '../../src/profile/data/models/profile_dto.dart';
import '../../src/real_estate/data/models/real_estate_model.dart';
import '../network/base_client.dart';
import 'notification_service.dart';

class HelperMethods {
  static String numberFormat(int number) {
    return NumberFormat('#,###').format(number);
  }

  static Future<CroppedFile?> getImagePicker() async {
    XFile? imageFile;
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    print('imageFile length ${await imageFile?.length()}'); // 4271
    return await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      //  aspectRatio: const CropAspectRatio(ratioX: 2, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
      ],
    );
  }

  static Future<File> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  static showErrorToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSuccessToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<void> launchCallPhone(String phoneNumber) async {
    if (phoneNumber.isNotEmpty) {
      Uri telephoneUrl = Uri.parse("tel:${getPhoneNumber(phoneNumber)}");
      if (await canLaunchUrl(telephoneUrl)) {
        await launchUrl(telephoneUrl);
      } else {
        showErrorToast('حدث خطأ أثناء الاتصال بالرقم');
      }
    } else {
      showErrorToast('رقم الهاتف غير متاح');
    }
  }

  static String getPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) throw 'Phone number is empty';
    String newPhoneNumber = phoneNumber.isEmpty ? '' : phoneNumber.contains('+') ? phoneNumber : '+966$phoneNumber';
    return newPhoneNumber;
  }

  static Future<void> launchWhatsApp(String phoneNumber) async {
    if (phoneNumber.isNotEmpty) {
      Uri whatsUpUrl = Uri.parse("https://wa.me/${getPhoneNumber(phoneNumber)}");
      if (await canLaunchUrl(whatsUpUrl)) {
        await launchUrl(whatsUpUrl, mode: LaunchMode.externalApplication);
      } else {
        showErrorToast('حدث خطأ اثناء الاتصال بالواتساب');
      }
    } else {
      showErrorToast('رقم الواتساب غير متاح');
    }
  }

  static Future launchUrlLink(String url) async {

    print('launchUrlLink $url');
    Uri uri = Uri.parse((url.contains('https') || url.contains('http')) ? url : 'https://$url');
    try {
      return await launchUrl(uri);
    } on Exception catch (e) {
      print('launchUrlLink Error ${e.toString()}');
      showErrorToast('حدث خطأ أثناء الاتصال بالرابط');
    }
  }

  static Future<void> launchEmail(String email) async {
    Uri emailUrl = Uri(
        scheme: 'mailto',
        path: email,
    );
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      showErrorToast('حدث خطأ أثناء الاتصال بالبريد الالكتروني');
    }
  }

  static Future<void> launchMap(double lat, double long) async {
    Uri mapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(mapUrl)) {
      await launchUrl(mapUrl, mode: LaunchMode.externalApplication);
    } else {
      showErrorToast('حدث خطأ أثناء الاتصال بالخريطة');
    }
  }

  // show date picker
  static Future<String> datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      return picked.toString();
    }
    return '';
  }

  static String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formatter = DateFormat('yyyy-MM-dd').format(dateTime);
    return formatter;
  }

  static setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getString('language') ?? 'en';
  }

  static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTime') ?? true;
  }

  static setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
  }

  // save ProfileDto to shared preferences
  static saveProfile(ProfileDto profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (profile.token == null || profile.token!.isEmpty) {
      String token = await getToken();
      profile.token = token;
      prefs.setString('profile', jsonEncode(profile.toJson()));
    } else {
      prefs.setString('profile', jsonEncode(profile.toJson()));
    }
  }
  static Future<List<SlideDto>?> getSliders() async {
    print('Starting getSliders...');
    try {
      // Get the shared preferences instance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Ensure the latest data is loaded
      await prefs.reload();

      // Retrieve the stored JSON string
      final String? jsonString = prefs.getString('sliders');
      print('Retrieved JSON string length: ${jsonString?.length ?? 'null'}');

      // Check if the JSON string is null or empty
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      // Decode the JSON string into a List of dynamic maps
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // Convert the List of dynamic maps to a List of SlideDto objects
      final List<SlideDto> slides = jsonList.map((json) => SlideDto.fromJson(json)).toList();

      // Debug print to check the conversion
      print('Decoded slides: $slides');

      // Return the list of SlideDto objects, or null if the list is empty
      return slides.isNotEmpty ? slides : null;
    } catch (e) {
      // Log the error for debugging
      print('Error in getSliders: ${e.toString()}');
      return null;
    }
  }
  static saveSlider(List<SlideDto> slides) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sliders', jsonEncode(slides.map((e) => e.toJson()).toList()));
  }
  static saveCars(List<CarDto> cars) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cars', jsonEncode(cars.map((e) => e.toJson()).toList()));
  }
  static Future<List<CarDto>?> getCars() async {
    try {
      // Get the shared preferences instance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Ensure the latest data is loaded
      await prefs.reload();

      // Retrieve the stored JSON string
      final String? jsonString = prefs.getString('cars');
      print('Retrieved JSON string length: ${jsonString?.length ?? 'null'}');

      // Check if the JSON string is null or empty
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      // Decode the JSON string into a List of dynamic maps
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // Convert the List of dynamic maps to a List of SlideDto objects
      final List<CarDto> slides = jsonList.map((json) => CarDto.fromJson(json)).toList();

      // Debug print to check the conversion
      print('Decoded slides: $slides');

      // Return the list of SlideDto objects, or null if the list is empty
      return slides.isNotEmpty ? slides : null;
    } catch (e) {
      // Log the error for debugging
      print('Error in getSliders: ${e.toString()}');
      return null;
    }
  }
  static savePlates(List<PlateDto> plates) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('plates', jsonEncode(plates.map((e) => e.toJson()).toList()));
  }
  static Future<List<PlateDto>?> getPlates() async {
    try {
      // Get the shared preferences instance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Ensure the latest data is loaded
      await prefs.reload();

      // Retrieve the stored JSON string
      final String? jsonString = prefs.getString('plates');
      print('Retrieved JSON string length: ${jsonString?.length ?? 'null'}');

      // Check if the JSON string is null or empty
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      // Decode the JSON string into a List of dynamic maps
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // Convert the List of dynamic maps to a List of SlideDto objects
      final List<PlateDto> slides = jsonList.map((json) => PlateDto.fromJson(json)).toList();

      // Debug print to check the conversion
      print('Decoded slides pale: $slides');

      // Return the list of SlideDto objects, or null if the list is empty
      return slides.isNotEmpty ? slides : null;
    } catch (e) {
      // Log the error for debugging
      print('Error in getSliders: ${e.toString()}');
      return null;
    }
  }
  static saveProperties(RealEstatesModel realEstatesModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('properties', jsonEncode(realEstatesModel.toJson()));
  }
  static Future<RealEstatesModel?> getProperties() async {
    try {
      // Get the shared preferences instance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Ensure the latest data is loaded
      await prefs.reload();

      // Retrieve the stored JSON string
      final String? jsonString = prefs.getString('properties');
      print('Retrieved JSON string length: ${jsonString?.length ?? 'null'}');

      // Check if the JSON string is null or empty
      if (jsonString == null || jsonString.isEmpty) {
        return null;
      }

      // Decode the JSON string into a List of dynamic maps
      final  jsonData = jsonDecode(jsonString);

      // Convert the List of dynamic maps to a List of SlideDto objects
      final RealEstatesModel properties = RealEstatesModel.fromJson(jsonData);

      // Debug print to check the conversion
      print('Decoded slides pale: $properties');

      // Return the list of SlideDto objects, or null if the list is empty
      return properties;
    } catch (e) {
      // Log the error for debugging
      print('Error in getSliders: ${e.toString()}');
      return null;
    }
  }
  //Pdf
  static Future<File> downloadPdf(String url, String fileName) async {
    try {
      final response = await HttpClient().getUrl(Uri.parse(url));
      final bytes = await response.close().then((res) => res.fold<List<int>>([], (list, b) => list..addAll(b)));
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName.pdf');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      print("Error downloading PDF: $e");
      throw Exception('Failed to download PDF');
    }
  }
  static Future<File?> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    } else {
      // المستخدم لم يختار ملف
      return null;
    }
  }

  // طريقة لعرض ملف PDF باستخدام Flutter PDFView
  static Future<void> viewPdf(BuildContext context, File file) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFView(
          filePath: file.path,
        ),
      ),
    );
  }



// get ProfileDto from shared preferences
  static Future<ProfileDto?>? getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.reload();
      final data = ProfileDto.fromJson(
          jsonDecode(prefs.getString('profile') ?? '{}') ?? {});
      print('getProfile ${data.toJson()}');
      if (data.id == null) return null;
      return data;
    } on Exception catch (e) {
      print('getProfile ${e.toString()}');
      return null;
    }
  }

  static removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseNotification().deleteToken();
    prefs.remove('profile');
  }

  static Future<String> getToken() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.token == null || profile!.token!.isEmpty) return '';
      return profile.token!;
    } on Exception catch (e) {
      print('profile?.token ${e.toString()}');
      return '';
    }
  }


  static Future<HeaderParams> getHeaderParams() async {
    try {
      ProfileDto? profile = await getProfile();
      return HeaderParams(
        token: profile?.token ?? '',
        role: profile?.role ?? '',
        id: profile?.id ?? 0,
      );
    } on Exception catch (e) {
      print('profile?.token ${e.toString()}');
      return HeaderParams(token: '', role: '', id: 0);
    }
  }

  static Future<bool> isVerified() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.isVerified == null) return false;
      return profile?.isVerified == 1 ? true : false;
    } on Exception catch (e) {
      print('profile?.isVerified ${e.toString()}');
      return false;
    }
  }

  static Future<bool> isAuth() async {
    String token = await getToken();
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // Note: Admin is not a role, it's a user with role != USER
  static Future<bool> isAdmin() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.role == null || profile!.role!.isEmpty) return false;
      return profile.role == Roles.SHOWROOM;
    } on Exception catch (e) {
      // print('profile?.token ${e.toString()}');
      return false;
    }
  }



  static Future<bool> isUser() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.role == null || profile!.role!.isEmpty) return false;
      return profile.role == Roles.USER;
    } on Exception catch (e) {
      // print('profile?.token ${e.toString()}');
      return false;
    }
  }
  static Future<bool> isRealEstateDeveloper() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.role == null || profile!.role!.isEmpty) return false;
      return profile.role == Roles.RealEstateDeveloper;
    } on Exception catch (e) {
      // print('profile?.token ${e.toString()}');
      return false;
    }
  }

  static Future<int> getUserId() async {
    return await getProfile()?.then((value) => value?.id ?? 0) ?? 0;
  }

  static Future<bool> isMe(int id) async {
    return await getUserId().then((value) => value == id);
  }


  static Future<String> getUserRole() async {
    return await getProfile()?.then((value) => value?.role ?? Roles.USER) ?? '';
  }

  static copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
