import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../core/utils/navigator.dart';
import '../../main_index.dart';
import '../bloc/map_picker_cubit.dart';
import 'allow_location_page.dart';
import 'map_picker_screen.dart';

class  MapPickerPage
    extends BaseBlocWidget<DataSuccess<Position?>, MapPickerCubit> {
  final LatLng? initialLocation;
  final Function(LatLng)? onGetLocation;
  MapPickerPage({Key? key,this.initialLocation, this.onGetLocation}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.getMyLocation();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Position?> state) {
    handleAppLifecycleState();
    return state.data == null
        ? AllowLocationPage(
      onAllowLocation: () {
        enableLocation();
      },
    )
        : MapPickerScreen(
      initialLocation: initialLocation,
      position: state.data!,
      onSearch: (value) => bloc.fetchPlacesAutocomplete(value),
      predictionsSearchStream: bloc.predictionsSearchStream,
      placeDetailsStream: bloc.placeDetailsStream,
      onAddAddress: (params) {
        onGetLocation?.call(params);
        pop();
      },
      onFetchPlaceDetails: (String placeId) {
        bloc.fetchPlaceDetails(placeId);
      },
    );
  }



  enableLocation() async {
    LocationPermission status = await Geolocator.requestPermission();
    print('status $status');
    if (status == LocationPermission.denied ||
        status == LocationPermission.deniedForever ||
        status == LocationPermission.whileInUse) {
      enableLocationFromSettings();
    } else {
      bloc.getMyLocation();
    }
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best,
        )).listen((Position position) {
      print('position $position');
    });
  }

  enableLocationFromSettings() {
    Geolocator.openLocationSettings();
  }

  handleAppLifecycleState() {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      print('SystemChannels> $msg');
      switch (msg) {
        case "AppLifecycleState.resumed":
          bloc.getMyLocation();
          break;
        default:
      }
      return Future.value();
    });
  }
}
