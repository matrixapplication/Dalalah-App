import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../core/components/base_stateless_widget.dart';

class AllowLocationPage extends BaseStatelessWidget {
  final Function() onAllowLocation;

  AllowLocationPage({Key? key, required this.onAllowLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: 30.paddingAll,
        child: Column(
          children: [
            AppIcon(
                icon: AppIcons.location, size: 200, color: primaryColor),
            const Spacer(),
            Text(
              strings.whats_your_location,
              style: headlineLarge.copyWith(
                fontSize: 20,
              ),
            ),
            20.ph,
            PrimaryButton(
              title: strings.allow_your_location,
              margin: 20.paddingVert,
              onPressed: onAllowLocation,
            ),
            // Text(
            //   strings.add_your_location_manually,
            //   style: bodyLarge.copyWith(
            //     fontSize: 18,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
