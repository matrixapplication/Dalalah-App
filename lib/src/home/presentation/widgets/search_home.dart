import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';

import '../../../main_index.dart';
import '../../domain/entities/car.dart';
import '../pages/search_screen.dart';
import 'home_header.dart';

///  Created by harby on 9/5/2023.
class SearchHome extends StatelessWidget {
  final Future<List<Car>>? Function(String)? onSearch;
  final Function(int)? onToggleFavorite;
  const SearchHome({
    Key? key,
    this.onSearch,
    this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(),
        10.ph,
        CustomTextField(
          padding: 16.paddingHoriz,
         // radius: 50,
   //   fillColor: Color(0xff95989A),
          maxHeight: 70,
          colorBorderSide: context.cardColor,
          iconPath: AppIcons.search,
          hintText: context.strings.search_here,
          hintStyle: context.displaySmall.copyWith(color: context.hintColor,),

          onTap: () {
            onSearchScreen(context);
          },
        ),
      ],
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
