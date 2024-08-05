
import '../../src/main_index.dart';

class Validation {
  //"^5(\\d{8})\$"
  // static bool isValidPhone(String phone) => RegExp("^(5|05)(\\d{8})\$").hasMatch(phone);

  static bool isArabicLetters(String name) =>
      RegExp("^[\u0621-\u064A\\s]+\$").hasMatch(name);

  static bool isValidFullName(String name) =>
      RegExp("^[\u0621-\u064a\\s]{3,}(?: [\u0621-\u064a\\s]+){2}\$")
          .hasMatch(name);

  static bool isValidIDNumber(String id) =>
      RegExp("^[1-2][0-9]{1,10}\$").hasMatch(id);

  static bool isValidNumber(String id) =>
      RegExp("^[0-9]{1,10}\$").hasMatch(id);

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);


  static String? validateEmail(String value) {
    // String pattern =
    //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //     r"{0,253}[a-zA-Z0-9])?)*$";
    // RegExp regex = new RegExp(pattern);
    if (!isEmailValid(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    if (value.length < 6) {
      return injector<ServicesLocator>().strings.password_must_be_at_least_6_characters;
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    if (value.length < 6) {
      return injector<ServicesLocator>().strings.password_must_be_at_least_6_characters;
    }
    if (value != password) {
      return injector<ServicesLocator>().strings.passwords_does_not_match;
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    return null;
  }

  static String? validatePhone(String value) {
    // if (value.isEmpty) {
    //   return injector<ServicesLocator>().strings.this_field_is_required;
    // }
    if (value.length > 9) {
      return injector<ServicesLocator>().strings.must_be_at_least_11_characters;
    }
    return null;
  }
  static String? validatePhoneRequired(String value) {
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    // if (value.startsWith('0')) {
    //   return injector<ServicesLocator>().strings.phone_number_must_start_with_5;
    // }
    if (value.length > 9) {
      return injector<ServicesLocator>().strings.must_be_at_least_11_characters;
    }
    return null;
  }

  static String? validatePrice(String value, String max, String min) {
    if(!isValidIDNumber(value)){
      return injector<ServicesLocator>().strings.price_must_be_a_number;
    }
    if (value.isEmpty) {
      return injector<ServicesLocator>().strings.this_field_is_required;
    }
    if (int.parse(value) > int.parse(max)) {
      return '$max ${injector<ServicesLocator>().strings.maximum}';
    }
    if (int.parse(value) < int.parse(min)) {
      return '$min ${injector<ServicesLocator>().strings.minimum}';
    }
    return null;
  }

  static bool isArabicLettersWithNumbers(String name) =>
      RegExp("^[\u0621-\u064A\\s0-9\\W]+\$").hasMatch(name);

  static bool isEnglishLetters(String name) =>
      RegExp("^[a-zA-Z\\s]+\$").hasMatch(name);

  // English Letters With Numbers with any character
  static bool isEnglishLettersWithNumbers(String name) =>
      RegExp("^[a-zA-Z\\s0-9\\W]+\$").hasMatch(name);

  static String? validateArabicText(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isNullOrEmpty()) {
      return strings.this_field_is_required;
    } else if (!Validation.isArabicLettersWithNumbers(value)) {
      return strings.must_be_arabic_letters;
    }
    return null;
  }

  static String? validateOnlyArabicText(String value){
    final strings = injector<ServicesLocator>().strings;
    if (value.isNullOrEmpty()) {
      return strings.this_field_is_required;
    } else if (!Validation.isArabicLetters(value)) {
      return strings.must_be_arabic_letters;
    }
    return null;
  }

  static String? validateOnlyNumbers(String value){
    final strings = injector<ServicesLocator>().strings;
    if (value.isNullOrEmpty()) {
      return strings.this_field_is_required;
    }
    else  if (value.length > 10) {
      return strings.must_be_10_numbers;
    }
    else if (!Validation.isValidNumber(value)) {
      return strings.must_be_numbers;
    }

    return null;
  }

  static String? validateOnlyEnglishLetters(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isNullOrEmpty()) {
      return strings.this_field_is_required;
    } else if (!Validation.isEnglishLetters(value)) {
      return strings.must_be_english_letters;
    }
    return null;
  }

  static String? validateEnglishText(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isNullOrEmpty()) {
      return strings.this_field_is_required;
    } else if (!Validation.isEnglishLettersWithNumbers(value)) {
      return strings.must_be_english_letters;
    }
    return null;
  }

}
