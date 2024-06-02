import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/buttons/app_icon_button.dart';
import 'package:dalalah/core/widgets/clickable_widget.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/core/widgets/stream/stream_state_widget.dart';
import 'package:dalalah/src/sell_car/domain/entities/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/widgets/pagination/loading_widget.dart';
import '../../../../home/domain/entities/brand.dart';
import '../../../../sell_car/domain/entities/brand_model_extension.dart';
import 'brand_models_filter_stream.dart';

///  Created by harby on 9/6/2023.
class BrandModelsExtensionFilterStream extends StatelessWidget {
  final List<BrandModel>? initialData;
  final StreamStateInitial<List<BrandModel>?> brandModelsStream;
  final Color? backgroundColor;
  final Function(int) onFilter;
  final String? title;

  const BrandModelsExtensionFilterStream({
    Key? key,
    this.initialData,
    required this.brandModelsStream,
    required this.onFilter,
    this.backgroundColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item = context.strings.all;
    return StreamBuilder<List<BrandModel>?>(
        stream: brandModelsStream.stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? const SmallLoading()
              : BrandModelsFilterList(
                  items: snapshot.data ?? initialData ?? [],
                  backgroundColor: backgroundColor,
                  onFilter: onFilter,
                  title: title,
                );
        });
  }
}
