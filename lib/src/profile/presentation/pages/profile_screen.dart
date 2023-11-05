import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../../settings/domain/entities/about_us_types_.dart';
import '../../domain/entities/profile.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final VoidCallback onRefresh;
  final VoidCallback onDeleteAccount;
  final VoidCallback onLogout;

  ProfileScreen({
    Key? key,
    required this.profile,
    required this.onRefresh,
    required this.onDeleteAccount,
    required this.onLogout,
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
                    subTitle: strings.edit_name_email_picture_change_password,
                    onTap: () async {
                      final isRefresh = await Navigators.pushNamed(
                          Routes.editProfilePage,
                          arguments: Profile());
                      if (isRefresh is bool) {
                        print('isRefresh $isRefresh');
                        //  onRefresh();
                      }
                    },
                  ),
                  ProfileItem(
                    title: strings.favorite_agencies,
                    icon: AppIcons.box,
                    subTitle: strings.dealers_showrooms_agents,
                    routeName: Routes.exhibitionPage,
                    arguments: strings.favorite_agencies,
                  ),
                  ProfileItem(
                    title: strings.favorites,
                    icon: AppIcons.heart_solid,
                    subTitle: strings.favorites,
                    routeName: Routes.favoritesAndAdsTabs,
                    arguments: false,
                  ),
                  ProfileItem(
                    title: strings.my_ads,
                    icon: AppIcons.save,
                    subTitle: strings.my_ads,
                    routeName: Routes.favoritesAndAdsTabs,
                    arguments: true,
                  ),
                  ProfileItem(
                    title: strings.notifications,
                    icon: AppIcons.notification,
                    subTitle: strings.notifications,
                    routeName: Routes.notificationsPage,
                  ),
                  ProfileItem(
                    title: strings.privacy_policy,
                    icon: AppIcons.privacy_policy,
                    subTitle: strings.privacy_policy,
                    routeName: Routes.aboutUs,
                    arguments: AboutUsTypes.PRIVACY,
                  ),
                  ProfileItem(
                    title: strings.terms_and_conditions,
                    icon: AppIcons.privacy_policy,
                    subTitle: strings.terms_and_conditions,
                    routeName: Routes.aboutUs,
                    arguments: AboutUsTypes.TERMS_AND_CONDITIONS,
                  ),
                  ProfileItem(
                    title: strings.about_us,
                    icon: AppIcons.privacy_policy,
                    subTitle: strings.about_us,
                    routeName: Routes.aboutUs,
                    arguments: AboutUsTypes.ABOUT_US,
                  ),
                  ProfileItem(
                    title: strings.logout,
                    icon: AppIcons.off,
                    isLogoutTile: true,
                    isLast: true,
                    onTap: () {
                      onLogout();
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
