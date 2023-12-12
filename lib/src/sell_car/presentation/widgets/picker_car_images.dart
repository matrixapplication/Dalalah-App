import 'dart:io';
import 'package:dalalah/src/sell_car/presentation/widgets/picker_main_image.dart';
import '../../../main_index.dart';

///  Created by harbey on 9/7/2023.
class PickerCarImages extends BaseStatelessWidget {
  final List<String>? initialImages;
  final Function(File, List<File>) onImagesSelected;
  PickerCarImages({Key? key, this.initialImages, required this.onImagesSelected,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File mainImage = File('');
    List<File> images = [File('')];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.car_images,
          style: context.bodySmall,
        ),
        10.ph,
        Text(
          strings.add_main_image,
          style: context.bodySmall,
        ),
        20.ph,
        PickerMainImage(
          onImageSelected: (file) {
            mainImage = file;
          },
        ),
        20.ph,
        Text(
          strings.add_car_image_at_most_10,
          style: context.bodySmall,
        ),
        10.ph,
        PickerSubImages(
          onImagesSelected: (files) {
           images = files;
            onImagesSelected(mainImage, images);
          },
        ),
      ],
    );
  }
}



class PickerSubImages extends StatelessWidget {
  final Function(List<File>)? onImagesSelected;
  const PickerSubImages({super.key, this.onImagesSelected});

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
                title: index <= 4 ? context.strings.doors_images : context.strings.other_images,
                icon: Icons.add_photo_alternate_rounded,
             //   imageUrl: (initialImages != null && initialImages!.isNotEmpty) ? initialImages?.first : null,
                onImageSelected: (image) {
                  images.add(image);
                  onImagesSelected?.call(images.sublist(1));
                  setSate(() {});
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
                  if(index <= 4)
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
                            '${context.strings.door} $index',
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

