import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/images/image_network.dart';

class Test extends StatelessWidget {
  final List<String> images;
  const Test({super.key,required this.images});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.cardColor,
          child:ListView.builder(
            itemCount: images.length,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                margin: const EdgeInsets.all(16),
                child:
                // ImageNetwork(
                //   url: images[index],
                //   fit: BoxFit.cover,
                //   height: 150,
                //   width: double.infinity,
                // ),
                Image.network(images[index],
                height: 150,
                  width: double.infinity,

                ),
              );
            },
          ),
      ),
    );
  }
}
