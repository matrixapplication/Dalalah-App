import '../../../../../main_index.dart';
import '../../widgets/car_properties.dart';

class CarDetailsDetailsView extends BaseStatelessWidget {
  final EdgeInsetsGeometry? padding;
  CarDetailsDetailsView({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? 20.paddingVert,
      child: const Column(
        children: [
          DetailsViewListTile(
            isOpen: true,
            title: 'المواصفات',
          ),
          DetailsViewListTile(
            title: 'المميزات',
          ),
          DetailsViewListTile(
            title: 'الامان',
          ),
        ],
      ),
    );
  }
}

class DetailsViewListTile extends StatelessWidget {
  final bool isOpen;
  final String title;

  const DetailsViewListTile({
    super.key,
    this.isOpen = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> properties = [
      CarPropertyItem(
        property: CarProperty(
          title: "سعة المحرك",
          subtitle: '2000',
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        property: CarProperty(
          title: "سعة المحرك",
          subtitle: '2000',
          icon: AppIcons.chair,
        ),
      ),
      CarPropertyItem(
        property: CarProperty(
          title: "سعة المحرك",
          subtitle: '2000',
          icon: AppIcons.timer,
        ),
      ),
    ];
    return StatefulBuilder(builder: (context, setState) {
      return ExpansionTile(
        tilePadding: 10.paddingHoriz,
        initiallyExpanded: isOpen,

        title: Text(
          title,
          style: context.bodyMedium
        ),
        collapsedIconColor: context.primaryColorDark,
        iconColor: context.primaryColor,
        children: [ Wrap(
          children: properties,
        )],
      );
    });
  }
}
