import '../../../../core/widgets/list-tile/custom_list_tile2.dart';
import '../../../main_index.dart';

class SettingsScreen extends BaseStatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile2(
          title: strings.change_language,
          onTap: () {
           Navigator.of(context).pushNamed(Routes.changeLanguage);
          },

          isArrowForward: true,
            trailing: Row(
              children: [
                Text(
                  strings.arabic,
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(width: 8),
                const AppIcon(icon: AppIcons.leftArrow, color: kGreyColor, size: 15),
              ],
            ),
        ),
        const CustomDivider(),

        CustomListTile2(
          title: strings.terms_and_conditions,
          onTap: () {},
        ),
        const CustomDivider(),
        CustomListTile2(
          title: strings.dark_mode,
          onTap: () {},
        ),
        const CustomDivider(),

        // CustomListTile2(
        //   title: strings.rate_the_app,
        //   onTap: () {},
        // ),
      ],
    );
  }
}
