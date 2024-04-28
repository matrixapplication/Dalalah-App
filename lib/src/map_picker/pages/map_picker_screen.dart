import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/widgets/buttons/stacked_button.dart';
import '../../../core/widgets/icons/icon_text.dart';
import '../../main_index.dart';
import '../widgets/map_picker_item.dart';
import '../widgets/map_prediction.dart';
import '../widgets/map_search.dart';

class MapPickerScreen extends BaseStatelessWidget {
  final LatLng? initialLocation;
  final Position? position;
  final Function(String) onSearch;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  final StreamStateInitial<MapPickerItem?> placeDetailsStream;
  final Function(LatLng)? onAddAddress;
  final Function(String) onFetchPlaceDetails;

  MapPickerScreen({Key? key, this.initialLocation, this.onAddAddress, required this.position, required this.onSearch, required this.predictionsSearchStream, required this.placeDetailsStream, required this.onFetchPlaceDetails});

  LatLng latLng =  const LatLng(0.0,0.0);
  Set<Marker> markers = {};
  final Completer<GoogleMapController> _controller = Completer();

  String details = '';
  StreamStateInitial<String> addressStream = StreamStateInitial();
  @override
  Widget build(BuildContext context) {
    onGetLocationDetailsStream();
    latLng = initialLocation ?? LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0);
    onLocationPicker(location: latLng);
    _initData();
    return StackedButton(
      titleButton: strings.pick_you_location,
      onPressed: () {
        if (details.isNotEmpty) {
          onAddAddress?.call(
              latLng
          );
        }
      },
      footerChild: StreamBuilder<String>(
        stream: addressStream.stream,
        initialData: '',
        builder: (context, snapshot) {
          print('addressStream ${snapshot.data}');
          return IconText(
            padding: 10.paddingBottom,
            text: snapshot.data ?? '',
            icon: AppIcons.location,
            isExpanded: true,
          );
        }
      ),
      child: Stack(
        children: [
          buildMap(),
          MapSearch(
            onSearch: onSearch,
            onSelectPlace: (data){
              addressStream.setData(data.description ?? '');
              onFetchPlaceDetails(data.placeId ?? '');
            },
            predictionsSearchStream: predictionsSearchStream,
          ),
        ],
      ),
    );
  }

  Widget buildMap() {
    return StatefulBuilder(
      builder: (context, setState) {
        return StreamBuilder<MapPickerItem?>(
          stream: placeDetailsStream.stream,
          builder: (context, snapshot) {
            return GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,

              initialCameraPosition: CameraPosition(
                target: LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              // onCameraMove: (CameraPosition newPosition) {
              //   // print(newPosition.target.toJson());
              //   latLng = newPosition.target;
              // },
              onTap: (location){
                onLocationPicker(location: location, setState: setState);
              },
              markers: markers,
              padding: EdgeInsets.only(top: 90.0,),
            );
          }
        );
      }
    );
  }

  onLocationPicker({LatLng? location, void Function(void Function())? setState}) async {
      latLng = location!;
      markers.add(Marker(
        markerId: MarkerId('1'),
        position: latLng,
      ));
      setState?.call((){});
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude, localeIdentifier: Localizations.localeOf(context!).toLanguageTag());
    print('placemarks ${placemarks.first.toJson()}');
    details = '${placemarks.first.street}, ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea}';
      addressStream.setData(details);
  }

  onGetLocationDetailsStream(){
    placeDetailsStream.stream.listen((event) {
      print('placeDetailsStream ${event?.toJson()}' );
      if(event != null){
        latLng = LatLng(
          double.parse(event.geometry?.location?.lat?.toString() ?? '0.0'),
          double.parse(event.geometry?.location?.lng?.toString() ?? '0.0'),
        );
        markers.add(Marker(
          markerId: MarkerId('1'),
          position: latLng,
        ));
       // detailsController.text = event.formattedAddress ?? '';
      }
      // zoom to location
      _controller.future.then((controller) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: latLng,
              zoom: 18,
            ),
          ),
        );
      });
    });
  }

  _initData() {
    if (initialLocation != null) {
      // details = address!.addressTitle ?? '';
      latLng = initialLocation!;
      addressStream.setData(details);
    }
  }
}
