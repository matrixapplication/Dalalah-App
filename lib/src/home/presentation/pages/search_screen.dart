import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class TheSearch extends SearchDelegate<String> {
  BuildContext contextPage;
  TheSearch({required this.contextPage});

  TextTheme get _textTheme => Theme.of(contextPage).textTheme;

  @override
  TextStyle? get searchFieldStyle => _textTheme.bodyMedium;

  @override
  String? get searchFieldLabel => AppLocalizations.of(contextPage)!.search_here;
  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
    hintStyle: _textTheme.displaySmall,
    filled: true,
    fillColor: contextPage.theme.inputDecorationTheme.fillColor,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
//    alignLabelWithHint: true,
  //  floatingLabelAlignment: FloatingLabelAlignment.center,
    contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
  );

  @override
  ThemeData appBarTheme(BuildContext context) {
    var superThemeData = super.appBarTheme(context);

    return superThemeData.copyWith(
      backgroundColor: Theme.of(context).primaryColor,
      textTheme: Theme.of(context).textTheme,
      appBarTheme: AppBarTheme(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,

      ),
    );
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return  GridView.builder(
        itemCount: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
        ),
        // controller: _scrollController,
        itemBuilder: (content, index) =>
            Container()
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  GridView.builder(
        itemCount: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
        ),
        // controller: _scrollController,
        itemBuilder: (content, index) =>
            Container()
    );
  }
}