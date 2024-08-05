import 'package:dalalah/src/real_estate/presentation/real_estate/widgets/real_estate_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/commen/common_state.dart';
import '../../../../../core/components/loading_widget.dart';
import '../../../../map_picker/widgets/custom_google_map.dart';
import '../../../data/models/real_estate_model.dart';
import 'map_screen.dart';

class CustomRealEstatesMapWidget extends StatelessWidget {
  final StreamStateInitial<RealEstatesModel?>  realEstatesData;
   CustomRealEstatesMapWidget({super.key, required this.realEstatesData});

  @override
  Widget build(BuildContext context) {

    return  StreamBuilder<RealEstatesModel?>(
        stream: realEstatesData.stream,
        builder: (context, snapshot) {
          final data = snapshot.data?.properties??[];
          if(snapshot.connectionState == ConnectionState.waiting
              ||data==null){
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7),
              child: const LoadingView(),
            );
          }else{
            final List<LatLng> locations = data.map((e) => LatLng(double.parse(e.lat!), double.parse(e.lng!))).toList();
            return Stack(
              children: [
                MapScreen(locations: locations),
                Positioned(
                    bottom: 10,
                    child:
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:data.length ,
                        itemBuilder: (context,index){
                          return  RealStateItemMapWidget(realEstate: data[index],);
                        }),
                  )
                  // ListView.builder(
                  //     itemCount:data.length ,
                  //     itemBuilder: (context,index){
                  //       return  RealStateItemMapWidget(realEstate: data[index],);
                  //     });
                )
              ],
            );

          }
        });
  }
}
