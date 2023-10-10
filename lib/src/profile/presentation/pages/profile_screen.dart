import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/app_circular_icon.dart';
import '../../../main_index.dart';
import '../../../settings/domain/entities/about_us_types_.dart';
import '../../domain/entities/profile.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final VoidCallback obRefresh;
  final VoidCallback onDeleteAccount;
  final VoidCallback onLogout;

  ProfileScreen(
      {Key? key, required this.profile, required this.obRefresh, required this.onDeleteAccount, required this.onLogout})
      : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: context.primaryColor,
      backgroundAppBar: context.primaryColor,
      body: RefreshIndicator(
        color: context.primaryColor,
         onRefresh: () async {
           obRefresh();
          },
        child: Column(
          children: [
            ProfileHeader(profile: profile),
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: 40.paddingTop,
                decoration: Decorations.kDecorationTopRadius(
                  color: context.cardColor,
                  radius: 25,
                ),
                child: SingleChildScrollView(
                  padding: 16.paddingBottom,
                  controller: scrollController,
                  child: Column(
                    children: [
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
                      ProfileItem(
                        title: strings.edit_profile,
                        icon: AppIcons.edit,
                        iconColor: context.cardColor,
                        iconBackgroundColor: theme.colorScheme.tertiaryContainer,
                        onTap: () async {
                         final isRefresh =  await Navigators.pushNamed(Routes.editProfilePage, arguments: profile);
                          if(isRefresh is bool){
                            print('isRefresh $isRefresh');
                            obRefresh();
                          }
                        },
                      ),
                      ProfileItem(
                        title: strings.favorites,
                        icon: AppIcons.heart,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.favoritesPage);
                        },
                      ),
                      ProfileItem(
                        title: strings.settings,
                        icon: AppIcons.settings,
                        iconBackgroundColor: theme.primaryColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.settings);
                        },
                      ),
                      ProfileItem(
                        title: strings.about_us,
                        iconData: Icons.home_work_outlined,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.aboutUs, arguments: AboutUsTypes.ABOUT_US);
                        },
                      ),
                      ProfileItem(
                        title: strings.buying_and_selling_about,
                        iconData: Icons.home_work_outlined,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.aboutUs, arguments: AboutUsTypes.BUYING_AND_SELLING_ABOUT);
                        },
                      ),
                      ProfileItem(
                        title: strings.terms_and_conditions,
                        iconData: Icons.description_outlined,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.aboutUs, arguments: AboutUsTypes.TERMS_AND_CONDITIONS);
                        },
                      ),
                      ProfileItem(
                        title: strings.privacy_policy,
                        iconData: Icons.privacy_tip_outlined,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          Navigators.pushNamed(Routes.aboutUs, arguments: AboutUsTypes.PRIVACY);
                        },
                      ),
                      ProfileItem(
                        title: strings.delete_account,
                        iconData: Icons.delete_forever_outlined,
                        iconBackgroundColor: theme.hintColor,
                        onTap: () {
                          onDeleteAccount();
                        },
                      ),
                      ProfileItem(
                        title: strings.logout,
                        icon: AppIcons.logout,
                        iconBackgroundColor: theme.hintColor,
                        isLast: true,
                        onTap: () {
                          onLogout();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
