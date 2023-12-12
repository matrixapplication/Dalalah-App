import 'dart:io';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/buttons/primary_icon_button.dart';
import '../../../main_index.dart';


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
      padding: 10.paddingVert,
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
                padding: 16.paddingAll,
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
                    PrimaryIconButton(
                      height: 45,
                      icon: '',
                      iconData: Icons.add_a_photo_rounded,
                      iconColor: Colors.white,
                      title: context.strings.select_image,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}