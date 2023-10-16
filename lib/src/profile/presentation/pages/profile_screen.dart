import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/app_circular_icon.dart';
import '../../../main_index.dart';
import '../../../settings/domain/entities/about_us_types_.dart';
import '../../domain/entities/profile.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends BaseStatelessWidget {
  // final Profile profile;
  // final VoidCallback obRefresh;
  // final VoidCallback onDeleteAccount;
  // final VoidCallback onLogout;

  ProfileScreen({
    Key? key,
    // required this.profile,
    // required this.obRefresh,
    // required this.onDeleteAccount,
    // required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.primaryColor,
      onRefresh: () async {
        // obRefresh();
      },
      child: Column(
        children: [
          const ProfileHeader(
              // profile: profile,
              ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.ph,
                  ProfileItem(
                    title: strings.account_settings,
                    icon: AppIcons.profile,
                    iconColor: context.cardColor,
                    subTitle: strings.edit_name_email_picture_change_password,
                    onTap: () async {
                      // final isRefresh = await Navigators.pushNamed(
                      //     Routes.editProfilePage,
                      //     arguments: profile);
                      // if (isRefresh is bool) {
                      //   print('isRefresh $isRefresh');
                      //   obRefresh();
                      // }
                    },
                  ),
                  ProfileItem(
                    title: strings.exhibitions,
                    icon: AppIcons.box,
                    subTitle: strings.dealers_showrooms_agents,
                    onTap: () {
                      // Navigators.pushNamed(Routes.aboutUs,
                      //     arguments: AboutUsTypes.ABOUT_US);
                    },
                  ),
                  ProfileItem(
                    title: strings.favorites,
                    icon: AppIcons.heart_solid,
                    subTitle: strings.favorites,
                    iconColor: Colors.white,
                    onTap: () {
                      Navigators.pushNamed(
                        Routes.favoritesAndAdsPage,
                        arguments: false,
                      );
                    },
                  ),
                  ProfileItem(
                    title: strings.my_ads,
                    icon: AppIcons.save,
                    subTitle: strings.my_ads,
                    iconBackgroundColor: theme.primaryColor,
                    onTap: () {
                      Navigators.pushNamed(
                        Routes.favoritesAndAdsPage,
                        arguments: true,
                      );
                    },
                  ),
                  ProfileItem(
                    title: strings.logout,
                    icon: AppIcons.off,
                    isLogoutTile: true,
                    isLast: true,
                    onTap: () {
                      // onLogout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowChildren extends StatelessWidget {
  final String icon;
  final String title;
  final bool isLast;

  const RowChildren(
      {Key? key, required this.icon, required this.title, this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8),
          child: Row(
            children: [
              AppIcon(icon: icon),
              const SizedBox(width: 12),
              Text(title, style: Theme.of(context).textTheme.headlineMedium!),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
          )
      ],
    );
  }
}

// ProfileItem(
//   title: strings.my_ads,
//   icon: AppIcons.ads,
//   backgroundColor: context.primaryColor,
//   margin: 16.paddingHoriz + 20.paddingBottom,
//   iconBackgroundColor: context.primaryColor,
//   colorTitle: context.cardColor,
//   contentPadding: 16.paddingHoriz + 16.paddingVert,
//   decoration: Decorations.kDecorationRadius(
//     color: context.primaryColor,
//     radius: 8,
//   ),
//   isLast: true,
//   onTap: () {
//     Navigators.pushNamed(Routes.editProfilePage);
//   },
// ),
