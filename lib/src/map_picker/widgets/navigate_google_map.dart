// import 'dart:async';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// import '../../main_index.dart';
// import '../pages/map_picker_page.dart';
// import 'custom_google_map.dart';
//
//
// class NavigateGoogleMap extends StatelessWidget {
//   final LatLng? initialLocation;
//   NavigateGoogleMap({super.key, this.initialLocation});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       InkWell(
//         onTap: () {
//           Navigator.of(context).pushNamed(MapPickerPage.routeName);
//         },
//         child: IgnorePointer(
//           child: CustomGoogleMap(
//             initialLocation: initialLocation,
//             onGetLocation: (lat, lng) {
//             },
//           ),
//         ),
//       );
//   }
// }
