import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';

import '../../../main_index.dart';

class EditProfileImage extends BaseStatelessWidget {
  final String image;
  final Function(File) onSelectImage;

  EditProfileImage({super.key, required this.image, required this.onSelectImage});

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File?> _imageStream = StreamStateInitial();
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
            color: context.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: StreamBuilder<File?>(
              stream: _imageStream.stream,
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? Image.file(
                        snapshot.data!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : ImageNetworkCircle(
                        image: image,
                        width: 120,
                        height: 120,
                      );
              }),
        ),
        PositionedDirectional(
          end: 20,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon:
                  Icon(Icons.camera_alt_outlined, color: context.primaryColor),
              onPressed: () async {
                final file = await HelperMethods.getImagePicker();
                _imageStream.setData(File(file!.path));
                onSelectImage(File(file.path));
              },
            ),
          ),
        ),
      ],
    );
  }
}
