

import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../main_index.dart';

class SearchBarRes extends StatefulWidget {
  final Color? borderColor;
  final Color? iconColor;
  final Color? hintColor;
  final Color? textColor;
  final VoidCallback? onClose;
  const SearchBarRes(
      {Key? key,
        this.borderColor,
        this.iconColor,
        this.hintColor,
        this.textColor, this.onClose})
      : super(key: key);

  @override
  State<SearchBarRes> createState() => _SearchBarResState();
}

class _SearchBarResState extends State<SearchBarRes> {




  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 280,
      height: 40,
      child: TypeAheadField(
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4)),
        hideOnEmpty: true,
        hideSuggestionsOnKeyboardHide: false,
        keepSuggestionsOnSuggestionSelected: true,
        hideOnLoading: true,
        textFieldConfiguration: TextFieldConfiguration(
            style: context.textTheme.titleSmall,
            decoration: InputDecoration(
              filled: true,
              suffixIcon: GestureDetector(onTap: (){
                widget.onClose!();
              },
                child: Icon(Icons.close , color: context.primaryColor,) ,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              fillColor: context.scaffoldBackgroundColor,
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 15.0, left: 15.0),
                child: Icon(Icons.search,


                    color: context.primaryColor),
              ),
              hintStyle: context.textTheme.displayMedium,
              hintText: context.strings.search_here,
              // contentPadding: const EdgeInsets.only(
              //     left: 16, right: 16.0, top: 0, bottom: 0),
            ),
            onSubmitted: (String value) async {


            }),




        suggestionsCallback: (String? pattern) {
          // final searchItemsProvider = Provider.of<SearchViewModel>(context , listen: false );
          // searchItemsProvider.search(context: context , search: pattern , isClear: true);
          // return searchItemsProvideroomsList != null ? [searchItemsProvideroomsList] : [] ;
          return[];
        },
        itemBuilder: (BuildContext context, itemData) {
          return Container() ;
        },
        onSuggestionSelected: (Object? suggestion) {},
      ),
    );
  }
}

