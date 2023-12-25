import 'dart:io';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/buttons/primary_icon_button.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';

class PickerMainImage extends StatelessWidget {
  final String? initialMainImage;
  final IconData? icon;
  final Function(File)? onImageSelected;

  const PickerMainImage(
      {Key? key,
      this.initialMainImage,
      this.onImageSelected,
      this.icon,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File>? streamStateInitial = StreamStateInitial();
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      padding: 10.paddingVert,
      height: 200,
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
              child: Padding(
                padding: 16.paddingHoriz + 5.paddingVert,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (snapshot.data != null && icon == null)
                        ? Image.file(
                            snapshot.data!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 120,
                          )
                        : initialMainImage != null
                            ? ImageNetwork(
                                url: initialMainImage!,
                                height: 100,
                                width: 120,
                              )
                            : Image.asset(
                                AppImages.photo,
                                height: 35,
                                width: 35,
                                fit: BoxFit.contain,
                              ),
                    PrimaryIconButton(
                      height: 45,
                      icon: '',
                      iconData: Icons.add_a_photo_rounded,
                      iconColor: Colors.white,
                      title: initialMainImage != null
                          ? context.strings.edit_image
                          : context.strings.select_image,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
