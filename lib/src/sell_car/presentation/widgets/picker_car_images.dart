import 'dart:io';
import 'package:dalalah/core/utils/helper_methods.dart';
import '../../../../core/widgets/buttons/primary_icon_button.dart';
import '../../../main_index.dart';

///  Created by harbey on 9/7/2023.
class PickerCarImages extends BaseStatelessWidget {
  PickerCarImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        const PickerMainImage(),
        20.ph,
        Text(
          strings.add_car_image_at_most_10,
          style: context.bodySmall,
        ),
        10.ph,
        const PickerSubImages(),
      ],
    );
  }
}

class PickerMainImage extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function(File)? onImageSelected;

  const PickerMainImage({Key? key, this.onImageSelected, this.icon, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File>? streamStateInitial = StreamStateInitial();
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      padding: 15.paddingVert,
      decoration: Decorations.kDecorationBorder(
        borderColor: context.colorScheme.outline,
        radius: 8,
      ),
      child: StreamBuilder<File>(
          stream: streamStateInitial.stream,
          builder: (ctx, snapshot) {
            return InkWell(
              onTap: () async {
                await HelperMethods.getImagePicker().then((value) {
                  if (value != null) {
                    streamStateInitial.setData(File(value.path));
                    onImageSelected!(File(value.path));
                  }
                });
              },
              child: (snapshot.data != null && icon == null)
                  ? Image.file(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    )
                  : Padding(
                      padding: 20.paddingAll,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   icon ?? Icons.image,
                          //   size: 50,
                          //   color: context.primaryColor.withOpacity(0.5),
                          // ),
                          Image.asset(
                            AppImages.photo,
                            height: 35,
                            width: 35,
                            fit: BoxFit.contain,
                          ),
                          25.ph,
                          // Text(
                          //   title ?? context.strings.add_main_image,
                          //   style: context.bodyMedium,
                          //   textAlign: TextAlign.center,
                          // ),
                          Padding(
                            padding: 70.paddingHoriz,
                            child: PrimaryIconButton(
                              height: 45,
                              icon: '',
                              iconData: Icons.add_a_photo_rounded,
                              iconColor: Colors.white,
                              title: context.strings.select_image,
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}


class PickerSubImages extends StatelessWidget {
  const PickerSubImages({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setSate) {
      return Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        padding: 15.paddingVert,
        decoration: Decorations.kDecorationBorder(
          borderColor: context.colorScheme.outline,
          radius: 8,
        ),
        child: Padding(
          padding: 20.paddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.photo,
                height: 35,
                width: 35,
                fit: BoxFit.contain,
              ),
              25.ph,
              Padding(
                padding: 70.paddingHoriz,
                child: PrimaryIconButton(
                  height: 45,
                  icon: '',
                  iconData: Icons.add_a_photo_rounded,
                  iconColor: Colors.white,
                  title: context.strings.select_images,
                ),
              ),
            ],
          ),
        ),
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

