import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/about_us.dart';

class AboutUsScreen extends StatelessWidget {
  final AboutUs data;
  const AboutUsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Text(
        data.description ?? '',
        style: context.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
