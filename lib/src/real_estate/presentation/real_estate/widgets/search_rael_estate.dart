import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';

import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/pages/search_screen.dart';
import '../../../../main_index.dart';

class SearchRealEstate extends StatelessWidget {
  final Future<List<Car>>? Function(String)? onSearch;
  final Function(int)? onToggleFavorite;
  const SearchRealEstate({
    Key? key,
    this.onSearch,
    this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: Decorations.kDecorationBottomRadius(
        color:context.primaryColor,
        radius: 8
      ),
      padding:10.paddingTop ,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: CustomTextField(
                margin: 16.paddingHoriz,
               // radius: 50,
                           //   fillColor: Color(0xff95989A),
                maxHeight: 60,
                colorBorderSide: context.cardColor,
                iconPath: AppIcons.search,
                hintText: context.strings.search_here,
                hintStyle: context.displaySmall.copyWith(color: context.hintColor,),
                onTap: () {
                  onSearchScreen(context);
                },
              ),
            ),
          ),
          InkWell(
            onTap: (){
              // pushNamed(Routes.filterRealEstatePage);
              Navigator.pushReplacementNamed(context, Routes.filterRealEstatePage);
            },
            child: Container(
              decoration: Decorations.kDecorationRadius(radius: 8,
                color: Colors.white,
              ),
              height: 45,
              width: 60,
              child: Center(child: SvgPicture.asset(AppIcons.filter,
              color: context.primaryColor,
              )),
            ),
          ),
          20.pw,
        ],
      ),
          );
  }

  onSearchScreen(BuildContext context) async {
    await showSearch(
      context: context,
      delegate: TheSearch(contextPage: context,
          onSearch: onSearch,
          onToggleFavorite: onToggleFavorite),
      query: '',
    );
  }
}
