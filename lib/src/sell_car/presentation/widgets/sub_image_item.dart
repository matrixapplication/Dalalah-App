import 'dart:io';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';

class SubImageItem extends StatelessWidget {
  final File? fileImage;
  final String urlImage;
  final Function(File)? onImagesSelected;
  final Function()? onRemoveImage;
  const SubImageItem({super.key, this.fileImage, required this.urlImage, this.onImagesSelected, this.onRemoveImage});

  @override
  Widget build(BuildContext context) {
    File? file = fileImage;
    StreamStateInitial<File>? fileStream = StreamStateInitial();
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
            child: StreamBuilder<File>(
              stream: fileStream.stream,
              builder: (context, snapshot) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: snapshot.data == null ? ImageNetwork(
                    url: urlImage,
                    fit: BoxFit.cover,
                  ) :
                  Image.file(
                    snapshot.data ?? file!,
                    fit: BoxFit.cover,
                  ),
                );
              }
            ),
          ),
          InkWell(
            onTap: () {
              onRemoveImage?.call();
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
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: InkWell(
                onTap: () async {
                  await HelperMethods.getImagePicker().then((value) {
                    if (value != null) {
                      fileStream.setData(File(value.path));
                      onImagesSelected?.call(File(value.path));
                    }
                  });

                },
                child: Container(
                    padding: 3.paddingAll,
                    width: double.infinity,
                    decoration: Decorations.kDecorationBottomRadius(
                      color: context.primaryColor.withOpacity(0.8),
                      radius: 10,
                    ),
                    child: Text(
                      context.strings.edit_image,
                      style: context.labelMedium,
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
