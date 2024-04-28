import 'package:dalalah/core/di/injector.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
// import 'package:place_picker/uuid.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../widgets/map_picker_item.dart';
import '../widgets/map_prediction.dart';

@Injectable()
class MapPickerCubit extends BaseCubit {
  MapPickerCubit();

  StreamStateInitial<List<MapPrediction>?> predictionsSearchStream = StreamStateInitial();
  StreamStateInitial<MapPickerItem?> placeDetailsStream = StreamStateInitial();


  void getMyLocation() {
    executeSuccess(() => _determinePosition());
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> fetchPlacesAutocomplete(String input) async {

    predictionsSearchStream.setData(null);
    try {
      Response response = await fetchLocationData(input);
      List<MapPrediction> data = response.data['predictions']
          .map<MapPrediction>((item) => MapPrediction.fromJson(item)).toList();
      predictionsSearchStream.setData(data);
    } catch (e) {
      predictionsSearchStream.setError(e);
      throw Exception('Failed to fetch places autocomplete');
    }
  }

  Future<Response> fetchLocationData(String input) async {
    Dio dio = Dio();

    // String sessionToken = Uuid().generateV4();
    Map<String, dynamic> queryParams = {
      'key': 'AIzaSyAd_vUDBk1i9jcfCAp-ghIv4BKNW6Dd6x0',
      'input': input,
      // 'language': Get.locale!.languageCode,
      // 'location': '${item.geometry!.location!.lat},${item.geometry!.location!.lng}',
 //     'radius': 150,
 //     'sessiontoken': sessionToken,
    };
    Response response = await dio.get(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      queryParameters: queryParams,
    );
    return response;
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    placeDetailsStream.setData(null);
    Dio dio = Dio();
    Map<String, dynamic> queryParams = {
      'key': 'AIzaSyAd_vUDBk1i9jcfCAp-ghIv4BKNW6Dd6x0',
    //  'location': '-33.866489%2C-151.1958561',
      'place_id': placeId,
      'language': injector<ServicesLocator>().languageCode,
    };
    Response response = await dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: queryParams,
    );
    try {
      MapPickerItem pickerItem = MapPickerItem.fromJson(response.data['result']);

      placeDetailsStream.setData(pickerItem);

    } catch (e) {
      placeDetailsStream.setError(e);
      throw Exception('Failed to decode place');
    }
  }
}
