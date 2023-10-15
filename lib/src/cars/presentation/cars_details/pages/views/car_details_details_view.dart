import '../../../../../main_index.dart';
import '../../widgets/car_properties.dart';

class CarDetailsDetailsView extends BaseStatelessWidget {
  CarDetailsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 20.paddingVert,
      child: const Column(
        children: [
          DetailsViewListTile(
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
  final String title;

  const DetailsViewListTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isOpen = false;
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
      CarPropertyItem(
        property: CarProperty(
          title: "سعة المحرك",
          subtitle: '2000',
          icon: AppIcons.fuel,
        ),
      ),
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
      CarPropertyItem(
        property: CarProperty(
          title: "سعة المحرك",
          subtitle: '2000',
          icon: AppIcons.fuel,
        ),
      ),
    ];
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          ListTile(
            splashColor: Colors.transparent,
            onTap: () {
              isOpen = !isOpen;
              setState(() {});
            },
            contentPadding: 30.paddingHoriz,
            title: Text(
              title,
              style: context.textTheme.displayMedium!.copyWith(
                color: AppColors.grey_2C
              ),
            ),
            trailing: AppIcon(
              icon: isOpen ? AppIcons.down_arrow : AppIcons.left_arrow,
              size: isOpen ? 10 : 27,
              color: const Color(0xff222222),
            ),
          ),
          isOpen
              ? Wrap(
                  children: properties,
                )
              : 0.ph,
        ],
      );
    });
  }
}
