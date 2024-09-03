import 'package:dalalah/src/home/presentation/pages/test.dart';

import '../../../../core/routes/app_links_service.dart';
import '../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../main_index.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../real_estate/data/models/real_estate_model.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../widgets/plates_list.dart';
import '../widgets/real_estates_list.dart';
import '../widgets/search_home.dart';
import '../../../add__ads/widgets/ads_types_list.dart';
import '../widgets/slider_widget.dart';
import '../widgets/cars_home_list.dart';

class HomeScreen extends BaseStatelessWidget {
  final StreamStateInitial<List<Slide>?> slidesStream ;
  final StreamStateInitial<List<Brand>?> brandsStream;
  final StreamStateInitial<List<Car>?> yourCarsStream;
  final StreamStateInitial<List<Plate>?> platesStream;
  final StreamStateInitial<RealEstatesModel?> realEstatesStream;
  final Function(int)? onFavoriteCar;
  final Function(int)? onFavoritePlate;
  final Future<List<Car>>? Function(String)? onSearch;
  final Function(int)? onToggleFavorite;
  HomeScreen({Key? key, required this.slidesStream, required this.brandsStream, required this.yourCarsStream, required this.platesStream, this.onFavoriteCar, this.onFavoritePlate, this.onSearch, this.onToggleFavorite,required this.realEstatesStream, }) : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 40.paddingVert,
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHome(
            onSearch: onSearch,
            onToggleFavorite: onToggleFavorite,
          ),
          15.ph,
          SliderWidget(
            slidesStream: slidesStream,
          ),
          // 25.ph,
          // InkWell(
          //   onTap: (){connectTimeout
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => Test(images:
          //         [
          //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb-NGEQDekk2BwsllLjk4tcIM_BPIzXECdsg&s',
          //           'https://dalalah.com.sa/storage/3006/image_cropper_B27CB88F-F0E2-4568-8975-8B948100E056-6002-0000050EC5F2DB65.jpg',
          //           'https://i.pinimg.com/236x/1a/df/7e/1adf7e06e332fe50506f03e8e6ee11a3.jpg',
          //           'https://dalalah.com.sa/storage/2165/Jeep.png',
          //           'https://dalalah.com.sa/storage/4121/resized.webp',
          //           'https://dalalah.com.sa/storage/2644/IMG_0083.jpeg',
          //           'https://i.pinimg.com/736x/96/3d/64/963d643c81ac09fa9beb117346a1b12c.jpg',
          //           'https://dalalah.com.sa/storage/3652/image_cropper_904F5D4F-E8E3-412A-833D-9804758841B4-8373-000006263E5226E3.jpg',
          //           'https://dalalah.com.sa/storage/2163/BMW.png',
          //           'https://pbs.twimg.com/profile_images/1528775264204906498/oufC8Yu8_400x400.jpg',
          //           'https://dalalah.com.sa/storage/2161/MG.png',
          //           'https://dalalah.com.sa/storage/2158/Chevrolet.png',
          //           'https://dalalah.com.sa/storage/2160/Geely.png',
          //
          //
          //
          //         ],)));
          //   },child: Center(child: Text('Test',style: context.bodySmall,),),
          // ),
          25.ph,
          const AdTypesList(),
          Container(
            color: context.cardColor,
            child: SingleChildScrollView(
              padding: 8.paddingTop,
              controller: scrollController,
              child: Column(
                children: [
                  RowSeeAllText(
                    routeName: Routes.carsPage,
                    title: context.strings.latest_cars,
                  ),
                  CarsHomeListHorizStream(
                    carsStream: yourCarsStream,
                    onToggleFavorite: (id) async => await onFavoriteCar!(id),
                  ),
                  RowSeeAllText(
                    title: strings.latest_paintings,
                    routeName: Routes.platesPage,
                  ),
                  PlatesList(
                    platesStream: platesStream,
                    onFavoritePlate: (id) async => await onFavoritePlate!(id),
                  ),
                  // RowSeeAllText(
                  //   routeName: Routes.realEstatePage,
                  //   title: context.strings.latest_properties,
                  // ),
                  // RealEstatesList(
                  //   realEstatesStream: realEstatesStream,
                  //   onFavoritePlate: (id) async => await onFavoritePlate!(id),
                  // ),
                ],
              )
            ),
          ),

        ],
      ),
    );
  }
}
