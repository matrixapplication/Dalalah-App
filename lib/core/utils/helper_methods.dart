import 'dart:convert';
import 'dart:io';

import 'package:dalalah/src/profile/domain/entities/roles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../src/main_index.dart';
import '../../src/profile/data/models/profile_dto.dart';

class HelperMethods {


  static String numberFormat(int number) {
   return NumberFormat('#,###').format(number);
  }

  static Future<CroppedFile?> getImagePicker() async {
    XFile? imageFile;
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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
    Uri telephoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      showErrorToast('حدث خطأ أثناء الاتصال بالرقم');
    }
  }

  static Future<void> launchWhatsApp(String phoneNumber) async {
    Uri whatsUpUrl = Uri.parse("whatsapp://send?phone=$phoneNumber");
    if (await canLaunchUrl(whatsUpUrl)) {
      await launchUrl(whatsUpUrl);
    } else {
      showErrorToast('حدث خطأ اثناء الاتصال بالواتساب');
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
    return prefs.getString('language') ?? 'en';
  }

  // save ProfileDto to shared preferences
  static saveProfile(ProfileDto profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (profile.token == null || profile.token!.isEmpty) {
      String token = await isAuth();
      profile.token = token;
      prefs.setString('profile', jsonEncode(profile.toJson()));
    } else {
      prefs.setString('profile', jsonEncode(profile.toJson()));
    }
  }

  // get ProfileDto from shared preferences
  static Future<ProfileDto?>? getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = ProfileDto.fromJson(
          jsonDecode(prefs.getString('profile') ?? '{}') ?? {});
      // print('getProfile ${data.toJson()}');
      if (data.id == null) return null;
      return data;
    } on Exception catch (e) {
      print('getProfile ${e.toString()}');
      return null;
    }
  }

  static removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('profile');
  }

  static Future<String> isAuth() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.token == null || profile!.token!.isEmpty) return '';
      return profile.token!;
    } on Exception catch (e) {
      // print('profile?.token ${e.toString()}');
      return '';
    }
  }

  static Future<bool> isAdmin() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.role == null || profile!.role!.isEmpty) return false;
      return profile.role != Roles.USER;
    } on Exception catch (e) {
      // print('profile?.token ${e.toString()}');
      return false;
    }
  }

}
