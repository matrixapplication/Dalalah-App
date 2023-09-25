import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../core/widgets/images/image_network_text.dart';
import '../../../../core/widgets/images/logo.dart';
import '../../domain/entities/profile.dart';

///  Created by harbey on 9/3/2023.
class ProfileHeader extends StatelessWidget {
  final Profile? profile;
  const ProfileHeader({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15, start: 16, end: 0, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ImageNetworkText(
              image: profile?.image,
              text: profile?.name,
              size: 50,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 5,
              child: const Logo()),
        ],
      ),
    );
  }
}
