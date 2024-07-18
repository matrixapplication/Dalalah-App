import 'dart:io';

import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../../../core/utils/helper_methods.dart';

class AddImagesRealEstateScreen extends StatefulWidget {
   AddImagesRealEstateScreen({super.key});

  @override
  State<AddImagesRealEstateScreen> createState() => _AddImagesRealEstateScreenState();
}

class _AddImagesRealEstateScreenState extends State<AddImagesRealEstateScreen> {
  File? mainImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 16.paddingHoriz+80.paddingTop,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.strings.images_real_estate,
                style: context.labelMedium.copyWith(
                    color: Colors.black
                ),
              ),
              Text(context.strings.add_main_image,
                style: context.labelMedium.copyWith(
                    color: Colors.grey
                ),
              ),
              10.ph,
              Container(
                width: double.infinity,
                decoration: Decorations.kDecorationBorder(
                  radius: 8
                ),
                child: Padding(
                  padding: 35.paddingVert,
                  child: Column(
                    children: [
                      mainImage!=null?
                        ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.file(
                          mainImage!,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ):
                      Image.asset(AppImages.image),
                      10.ph,
                      InkWell(
                        onTap: (){
                          setState(() async{
                            mainImage=await  HelperMethods.getImageFromGallery();
                          });
                         },
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: Decorations.kDecorationBorder(
                              radius: 4,
                            backgroundColor:context. primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_a_photo,color: Colors.white,),
                              5.pw,
                              Text(context.strings.choose_image,
                              style: context.labelMedium.copyWith(
                                  color: Colors.white),
                              ),

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              32.ph,
              Text(context.strings.choose_image_mess,
                style: context.labelMedium.copyWith(
                    color: Colors.grey
                ),
              ),
              10.ph,
              Container(
                height:_images.length <=3? 200:330,
                width: double.infinity,
                decoration: Decorations.kDecorationBorder(
                    radius: 8
                ),
                child: Padding(
                  padding:_images.isNotEmpty?16.paddingVert: 35.paddingVert,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _images.isNotEmpty?
                      Expanded(
                        child: Padding(
                          padding: 10.paddingHoriz,
                          child: GridView.builder(

                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                            ),
                            padding: EdgeInsets.zero,
                            itemCount: _images.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(
                                    _images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ):
                      Image.asset(AppImages.image),
                      10.ph,
                      InkWell(
                        onTap: _pickImages,
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: Decorations.kDecorationBorder(
                            radius: 4,
                            backgroundColor: context.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_a_photo,color: Colors.white,),
                              5.pw,
                              Text(context.strings.choose_image,
                                style: context.labelMedium.copyWith(
                                    color: Colors.white),
                              ),

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              85.ph,
              PrimaryOutlinesButtons(
                title1: context.strings.share,
                title2: context.strings.back,
                onPressed1: () {
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

   final ImagePicker _picker = ImagePicker();

   List<File> _images = [];

   Future<void> _pickImages() async {
     final List<XFile>? pickedFiles = await _picker.pickMultiImage();

     if (pickedFiles != null) {
       setState(() {
         _images = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
       });
     }
   }
}
