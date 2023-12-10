
import '../../data/models/settings_price_dto.dart';

class SettingsPrice {
  int? carMaxPrice;
  int? carMinPrice;

  SettingsPrice({this.carMaxPrice, this.carMinPrice});

   factory SettingsPrice.fromDto(SettingsPriceDto json) {
      return SettingsPrice(
        carMaxPrice: json.carMaxPrice,
        carMinPrice: json.carMinPrice
      );
   }
}

