import 'dart:io';

import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../sell_car/presentation/widgets/picker_car_images.dart';
import '../../../../data/models/add_real_estate_params.dart';

class AddImagesRealEstateScreen extends BaseStatelessWidget {
   AddImagesRealEstateScreen( {super.key,required this.categoryName,this.onShare});
   final String categoryName;

   final Function(AddRealEstateParams params)? onShare;

  File mainImage = File('');

  List<File> imagesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 16.paddingHoriz+80.paddingTop,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${context.strings.images_real_estate} $categoryName',
                style: context.labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              10.ph,
              PickerCarImages(
                length: 10,
                mainTitle:context.strings.add_main_image,
                title: '${context.strings.add_images} $categoryName ${context.strings.add_images_max_ten_image}',
                onImagesSelected: (File x, List<File> images) {
                  mainImage=x;
                  imagesList=images;
                },
              ),
              85.ph,
              PrimaryOutlinesButtons(
                title1: context.strings.share,
                title2: context.strings.back,
                onPressed1: () {
                  AddRealEstateParams addRealEstateParams=AddRealEstateParams(
                    cover: mainImage,
                    images: imagesList
                  );
                  onShare!(addRealEstateParams);
                },
                onPrevPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
