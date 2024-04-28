import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../main_index.dart';
import '../pages/map_picker_page.dart';


class CustomGoogleMap extends StatelessWidget {
  final LatLng? initialLocation;
  final bool? isOpenMap;
  Function(double lat, double lng) onGetLocation;
  CustomGoogleMap({super.key, this.initialLocation, required this.onGetLocation, this.isOpenMap = false});


  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  StreamStateInitial<LocationData?> locationStream =
  StreamStateInitial<LocationData?>();

  LatLng? _initialLocation;

  @override
  Widget build(BuildContext context) {
    fetchCurrentLocation();
    return  InkWell(
      onTap: () {
        if(isOpenMap == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MapPickerPage(
                    initialLocation: _initialLocation,
                    onGetLocation: (latLng) {
                      _initialLocation = latLng;
                      LocationData currentLocation = LocationData.fromMap({
                        'latitude': latLng.latitude,
                        'longitude': latLng.longitude,
                      });
                      locationStream.setData(currentLocation);
                      onGetLocation(latLng.latitude, latLng.longitude);
                      locationStream.setData(currentLocation);
                      _controller.future.then((controller) {
                        controller.animateCamera(
                            CameraUpdate.newLatLng(_initialLocation!));
                      });
                    },
                  ),
            ),
          );
        }
      },
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          padding: 10.paddingAll,
          margin: 20.paddingBottom,
          decoration:  Decorations.kDecorationOnlyRadius(color: context.hintColor.withOpacity(0.7)),
          child: Container(
            height: 150,
            decoration: Decorations.kDecorationBoxShadow(),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: StreamBuilder<LocationData?>(
                stream: locationStream.stream,
                builder: (context, snapshot) {
                  return IgnorePointer(
                    ignoring: false,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(snapshot.data?.latitude ?? 0.0, snapshot.data?.longitude ?? 0.0),
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId('currentLocation'),
                          position: LatLng(snapshot.data?.latitude ?? 0.0, snapshot.data?.longitude ?? 0.0),
                        ),
                      },
                    ),
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> fetchCurrentLocation() async {
    print('initialLocation $initialLocation');
    Location location = Location();
    try {
      LocationData currentLocation = initialLocation == null ? await location.getLocation() :
      LocationData.fromMap({
        'latitude': initialLocation!.latitude,
        'longitude': initialLocation!.longitude,
      });
      locationStream.setData(currentLocation);
      _controller.future.then((controller) {
        controller.animateCamera(CameraUpdate.newLatLng(initialLocation ?? LatLng(currentLocation.latitude!, currentLocation.longitude!)));
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}
