import 'package:dalalah/core/exceptions/api_exception.dart';
import 'package:dalalah/core/utils/helper_methods.dart';

import '../../../core/utils/navigator.dart';
import '../../../navigation_pages.dart';
import '../../main_index.dart';
import '../../home/domain/entities/section.dart';
import '../../plates/domain/entities/plate_args.dart';

class AddYourAdPage extends BaseStatelessWidget {
  AddYourAdPage({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.add_your_ad,
      body: Padding(
        padding: 20.paddingAll,
        child: FutureBuilder(
            initialData: false,
            future: HelperMethods.isAuth(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const LoadingView()
                  : snapshot.data != true
                      ? ErrorPlaceHolderWidget(
                          exception: ApiException(
                            strings.you_must_login_first,
                            401,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(isDeveloper==false)
                              Expanded(
                              child: _SectionsItem(
                                section: Section(
                                  title: strings.add_car,
                                  image: AppImages.add_car,
                                  routeName: Routes.sellCarPage,
                                  imageSize: 500,
                                  width: double.infinity,
                                ),
                                index: 0,
                              ),
                            ),
                            20.ph,
                            if(isDeveloper==false)
                            Expanded(
                              child: _SectionsItem(
                                section: Section(
                                  title: strings.add_plate,
                                  image: AppImages.add_plate,
                                  routeName: Routes.plateFilterPage,
                                  width: double.infinity,
                                  arguments: PlateArgs(),
                                ),
                                index: 0,
                              ),
                            ),
                            // FutureBuilder(
                            //   future: HelperMethods.getUserRole(),
                            //   builder: (context, snapshot) {
                            //     return snapshot.data == Roles.USER ?
                            //       Expanded(
                            //       child: _SectionsItem(
                            //         section: Section(
                            //           title: strings.add_plate,
                            //           image: AppImages.add_plate,
                            //           routeName: Routes.plateFilterPage,
                            //           width: double.infinity,
                            //         ),
                            //         index: 0,
                            //       ),
                            //     ) : 0.ph;
                            //   }
                            // ),
                            // 20.ph,
                            if(isDeveloper==true)
                              SizedBox(
                                height: 270,
                                child: _SectionsItem(
                                  section: Section(
                                    title: strings.add_real_estate,
                                    image: AppImages.add_real_estate,
                                    routeName: Routes.addRealEstatePage,
                                    width: double.infinity,
                                  ),
                                  index: 0,
                                ),
                              )
                          ],
                        );
            }),
      ),
    );
  }
}

class _SectionsItem extends StatelessWidget {
  final Section section;
  final int index;

  const _SectionsItem({
    Key? key,
    required this.section,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startPadding = index == 0 ? 20 : 0;
    return GestureDetector(
      onTap: () => pushNamed(section.routeName, ),
      child: Container(
        margin: startPadding.paddingStart + 10.paddingEnd,
        padding: 10.paddingVert,
        width: double.infinity,
        decoration: Decorations.kDecorationBorderWithRadius(
          radius: 20,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: context.gray_E2,
                    radius: 90,
                  ),
                  Image.asset(
                    section.image,
                    height: 150,
                    width: 150,
                    scale: 1,
                  ),
                ],
              ),
            ),
            15.ph,
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  section.title,
                  style: context.bodySmall.copyWith(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
