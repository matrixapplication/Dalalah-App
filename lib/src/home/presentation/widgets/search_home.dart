import 'package:delala/core/widgets/text-field/custom_text_field.dart';
import 'package:delala/src/home/presentation/widgets/search_text_field.dart';
import 'package:delala/src/home/presentation/widgets/tap_effect.dart';

import '../../../main_index.dart';
import '../pages/search_screen.dart';
import 'home_header.dart';

///  Created by harbey on 9/5/2023.
class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
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
            onSearch(context);
          },
        ),
      ],
    );
  }

  onSearch(BuildContext context) async {
    await showSearch(
      context: context,
      delegate: TheSearch(contextPage: context),
      query: '',
    );
  }
}
