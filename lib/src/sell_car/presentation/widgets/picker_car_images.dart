import 'dart:io';

import 'package:arabitac/core/utils/helper_methods.dart';
import 'package:arabitac/src/main_index.dart';

///  Created by harbey on 9/7/2023.
class PickerCarImages extends StatelessWidget {
  const PickerCarImages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<File> images = [File('')];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PickerMainImage(),
        20.ph,
        StatefulBuilder(builder: (context, setSate) {
          return GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              print('index $index');
              if (index == 0) {
                return PickerMainImage(
                  title: context.strings.other_images,
                  icon: Icons.add_photo_alternate_rounded,
                  onImageSelected: (image) {
                    images.add(image);
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
                     onTap: (){
                      images.removeAt(index);
                      setSate(() {});
                    },
                    child: Container(
                    padding: 5.paddingAll,
                    decoration: Decorations.kDecorationRadius(
                      radius: 10,
                      color: context.primaryColor.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.highlight_remove_outlined,
                      color: Colors.red,
                      size: 18,
                    ),
                ),
                  ),
                  ],
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

class PickerMainImage extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function(File)? onImageSelected;
  const PickerMainImage({Key? key, this.onImageSelected, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File>? streamStateInitial = StreamStateInitial();
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: Decorations.kDecorationRadius(
        color: context.primaryColor.withOpacity(0.1),
        radius: 10,
      ),
      child: StreamBuilder<File>(
          stream: streamStateInitial.stream,
          builder: (context, snapshot) {
            return InkWell(
              onTap: () async {
                await HelperMethods.getImagePicker().then((value) {
                  if (value != null) {
                    streamStateInitial.setData(File(value.path));
                    onImageSelected!(File(value.path));
                  }
                });
              },
              child: (snapshot.data != null && icon  == null )
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
                          Icon(
                            icon ?? Icons.image,
                            size: 50,
                            color: context.primaryColor.withOpacity(0.5),
                          ),
                          10.ph,
                          Text(
                            title ?? context.strings.add_main_image,
                            style: context.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
