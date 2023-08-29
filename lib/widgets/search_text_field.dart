
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shimmer/shimmer.dart';




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
      width: 280.w,
      height: 40.h,
      child: TypeAheadField(
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4)),
        hideOnEmpty: true,
        hideSuggestionsOnKeyboardHide: false,
        keepSuggestionsOnSuggestionSelected: true,
        hideOnLoading: true,
        textFieldConfiguration: TextFieldConfiguration(
            style: TextStyle(
              color: widget.textColor ?? Colors.black,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              filled: true,
              suffixIcon: GestureDetector(onTap: (){
                widget.onClose!();
              },
                child: Icon(Icons.close , color: primaryColor,) ,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide.none),
              fillColor: Colors.white,
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 15.0, left: 15.0),
                child: Icon(Icons.search,


                    color: primaryColor),
              ),
              hintStyle: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w400,
                  fontSize: 15.h,
                  color: Colors.black),
              hintText:"search",
              // contentPadding: const EdgeInsets.only(
              //     left: 16, right: 16.0, top: 0, bottom: 0),
            ),
            onSubmitted: (String value) async {


            }),




        suggestionsCallback: (String? pattern) {
          // final searchItemsProvider = Provider.of<SearchViewModel>(context , listen: false );
          // searchItemsProvider.search(context: context , search: pattern , isClear: true);
          // return searchItemsProvider.roomsList != null ? [searchItemsProvider.roomsList] : [] ;
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

