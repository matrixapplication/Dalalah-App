import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final List<LatLng> locations;

  MapScreen({required this.locations});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    for (var location in widget.locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.locations.isNotEmpty ? widget.locations[0] : LatLng(0, 0),
          zoom: 10.0,
        ),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        markers: _markers,
      ),
    );
  }
}
