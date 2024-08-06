import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/src/real_estate/presentation/real_estate/widgets/real_estate_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/components/loading_widget.dart';
import '../../../data/models/real_estate_model.dart';

class CustomRealEstateListWidget extends StatelessWidget {
  final StreamStateInitial<RealEstatesModel?>  realEstatesData;
  const CustomRealEstateListWidget({super.key, required this.realEstatesData});

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<RealEstatesModel?>(
          stream: realEstatesData.stream,
          builder: (context, snapshot) {
            final data = snapshot.data?.properties!;
            if(snapshot.connectionState == ConnectionState.waiting
                ||data==null){
              return Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.0),
                child: const LoadingView(),
              );
            }else{
              if(data.isEmpty){
                return Center(child: Text(context.strings.message_not_data),);
              }else{
                return
                  ListView.builder(
                      itemCount:data.length ,
                      itemBuilder: (context,index){
                        return  RealStateItemWidget(realEstate: data[index],);
                      });
              }
              }
          });

    // SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       RealStateItemWidget(),
    //       RealStateItemWidget(),
    //       RealStateItemWidget(),
    //       RealStateItemWidget(),
    //     ],
    //   ),
    // );
  }
}
