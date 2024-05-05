import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../domain/entities/about_us.dart';

class AboutUsScreen extends StatelessWidget {
  final AboutUs data;

  const AboutUsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // \r => break line
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Html(
        data: data.description ?? '',
      ),
    );
  }
}
