import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/core/widgets/icons/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../map_picker/widgets/custom_google_map.dart';
import '../../../domain/entities/plate.dart';
import '../widgets/plate_property.dart';

class PlatesDetailsWidget extends BaseStatelessWidget {
  final Plate plate;
  final Function()? onToggleFavorite;

  PlatesDetailsWidget({Key? key, required this.plate, this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: 10.paddingAll,
            margin: 20.paddingBottom,
            decoration: Decorations.kDecorationBorderWithRadius(
                color: scaffoldBackgroundColor,
                borderColor: context.gray_5c,
                radius: 50),
            child: IconText(
              mainAxisAlignment: MainAxisAlignment.start,
              text: plate.user?.name ?? '',
              icon: plate.user?.image ?? '',
              iconSize: 40,
              imageRadius: 500,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: PlatesDetailsProperty(
                  label: strings.plate_type,
                  value: plate.plateType == 'private'
                      ? strings.plate_private
                      : strings.plate_transfer,
                ),
              ),
              14.pw,
              Expanded(
                child: PlatesDetailsProperty(
                  label: strings.city,
                  value: plate.city?.name ?? '',
                ),
              ),
            ],
          ),
          20.ph,
          Row(
            children: [
              Expanded(
                child: PlatesDetailsProperty(
                  label: strings.announcement_date,
                  value: plate.createdAt ?? '',
                ),
              ),
              14.pw,
              Expanded(
                child: PlatesDetailsProperty(
                  label: strings.updated_at,
                  value: plate.updatedAt ?? '',
                ),
              ),
            ],
          ),
          PlatesDetailsProperty(
            label: strings.ad_number,
            value: plate.id.toString(),
          ),
          20.ph,
          CustomGoogleMap(
            isOpenMap: true,
            initialLocation: LatLng(plate.lat ?? 0, plate.lng ?? 0),
            onGetLocation: (lat, lng) {},
          ),
        ],
      ),
    );
  }
}
