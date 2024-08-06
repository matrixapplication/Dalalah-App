import 'dart:io';
import 'package:dalalah/src/home/data/models/car_dto.dart';
import 'package:dalalah/src/sell_car/presentation/widgets/picker_main_image.dart';
import 'package:dalalah/src/sell_car/presentation/widgets/sub_image_item.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../../core/widgets/snack_bar/snack_bar_manager.dart';
import '../../../main_index.dart';
import '../../data/models/edit_image_params.dart';

///  Created by harby on 9/7/2023.
class PickerCarImages extends BaseStatelessWidget {
  final String? initialMainImage;
  final String? mainTitle;
  final int? length;
  final String? title;
  final List<ImageDto>? initialImages;
  final Function(File, List<File>) onImagesSelected;
  final Function(EditImageCarParams)? onEditCarImage;
  final Function(EditImageCarParams)? onAddCarImage;
  final Function(int)? onDeleteCarImage;

  PickerCarImages( {
    Key? key,
    this.mainTitle, this.title,
    this.length,
    this.initialMainImage,
    this.initialImages,
    required this.onImagesSelected,
    this.onEditCarImage,
    this.onAddCarImage,
    this.onDeleteCarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File mainImage = File('');
    List<File> images = [];
    return StatefulBuilder(builder: (context,setState){

      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.ph,
          Text(
            mainTitle??
                strings.add_main_image,
            style: context.bodySmall,
          ),
          20.ph,
          PickerMainImage(
            initialMainImage: initialMainImage,
            onImageSelected: (file) {

              mainImage = file;
              onImagesSelected(mainImage, images);
              if(initialMainImage != null || initialMainImage!.isEmpty) {
                onEditCarImage?.call(EditImageCarParams(
                  image: file,
                ));
              }
            },
          ),
          20.ph,
          Text(
            title??strings.add_car_image_at_most_10,
            style: context.bodySmall,
          ),
          10.ph,
          PickerSubImages(
            length: length??0,
            // initialImages: initialImages,
            // onEditCarImage: onEditCarImage,
            onImagesSelected: (files) {
              images = files;
              onImagesSelected(mainImage, images);
            },
          ),
          10.ph,
          GridView.builder(
            itemCount: initialImages?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            padding: 0.paddingAll,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {

              return SubImageItem(
                urlImage: initialImages?[index].image ?? '',
                onImagesSelected: (image) {
                  onAddCarImage?.call(EditImageCarParams(
                    imageId: initialImages?[index].id ?? 0,
                    image: image,
                  ));

                },
                onRemoveImage: (isNetwork) {

                  if(isNetwork==false){
                    images.removeAt(index);
                  }
                  List<File> files = images.map((e) => e as File).toList();
                  onImagesSelected(mainImage, files);
                  if(isNetwork==true){
                    initialImages!.remove(initialImages![index]);
                    onDeleteCarImage!(initialImages![index].id??0);
                    setState((){});
                  }
                },
              );
            },
          ),
        ],
      );
    });
  }
}
class PickerSubImages extends StatelessWidget {
  final int? length;
  final Function(List<File>)? onImagesSelected;
  const PickerSubImages({super.key, this.onImagesSelected, this.length});

  @override
  Widget build(BuildContext context) {
    List<File> images = [File('')];
    return StatefulBuilder(builder: (context, setSate) {
      return GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          padding: 0.paddingAll,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0) {
              return PickerMainImage(
                //title: '${index + 1}',
                icon: Icons.add_photo_alternate_rounded,
                //   imageUrl: (initialImages != null && initialImages!.isNotEmpty) ? initialImages?.first : null,
                onImageSelected: (image) {
                  if(length!=null &&length!=0){
                      if(images.length<=length!){
                        images.add(image);
                        onImagesSelected?.call(images.sublist(1));
                        setSate(() {});
                      }else{
                        SnackBarManager.showErrorSnackBar(
                            context.strings.please_select_max_ten_image);
                        return;
                      }
                    }
                  else{
                      images.add(image);
                      onImagesSelected?.call(images.sublist(1));
                      setSate(() {});
                    }

                },
              );
            }
            return Container(
              margin: 5.paddingVert,
              decoration: Decorations.kDecorationRadius(
                radius: 10,
                color: context.primaryColor.withOpacity(0.1),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      images.removeAt(index);
                      // onImagesSelected!(images);
                      setSate(() {});
                    },
                    child: Container(
                      padding: 3.paddingAll,
                      margin: 5.paddingAll,
                      decoration: Decorations.kDecorationCircle(
                        color: context.cardColor,
                      ),
                      child: const Icon(
                        Icons.highlight_remove_outlined,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  ),
                  if(length!=null?index<=length!:index <= 4)
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                          padding: 3.paddingAll,
                          width: double.infinity,
                          decoration: Decorations.kDecorationBottomRadius(
                            color: context.primaryColor.withOpacity(0.8),
                            radius: 10,
                          ),
                          child: Text(
                            '$index',
                            style: context.labelMedium,
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                ],
              ),
            );
          }
      );
      // return GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //   ),
      //   physics: const NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   itemBuilder: (context, index) {
      //     print('index $index');
      //     if (index == 0) {
      //       return PickerMainImage(
      //         title: context.strings.other_images,
      //         icon: Icons.add_photo_alternate_rounded,
      //         onImageSelected: (image) {
      //           images.add(image);
      //           setSate(() {});
      //         },
      //       );
      //     }
      // return Container(
      //   margin: 5.paddingVert,
      //   decoration: Decorations.kDecorationRadius(
      //     radius: 10,
      //     color: context.primaryColor.withOpacity(0.1),
      //   ),
      //   child: Stack(
      //     alignment: AlignmentDirectional.topEnd,
      //     children: [
      //       Positioned.fill(
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(10),
      //           child: Image.file(
      //             images[index],
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           images.removeAt(index);
      //           setSate(() {});
      //         },
      //         child: Container(
      //           padding: 5.paddingAll,
      //           decoration: Decorations.kDecorationRadius(
      //             radius: 10,
      //             color: context.primaryColor.withOpacity(0.1),
      //           ),
      //           child: const Icon(
      //             Icons.highlight_remove_outlined,
      //             color: Colors.red,
      //             size: 18,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // );

      //   },
      // );
    });
  }
}