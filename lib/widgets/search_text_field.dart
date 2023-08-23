//
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:tokenchat/core/resources/app_colors.dart';
// import 'package:tokenchat/core/resources/spaces.dart';
// import 'package:tokenchat/core/servieces/responsive/num_extensions.dart';
// import 'package:tokenchat/data/models/room_model/room_model.dart';
// import 'package:tokenchat/data/models/searchModel/search_model.dart';
// import 'package:tokenchat/view/component/custom_text.dart';
// import 'package:tokenchat/view/component/cutom_shimmer_image.dart';
// import 'package:tokenchat/view/component/indicator.dart';
// import 'package:tokenchat/view/component/tap_effect.dart';
// import 'package:tokenchat/view/friends/view_model/send_request_view_model.dart';
// import 'package:tokenchat/view/rooms/view_model/search_view_model.dart';
//
//
//
// class SearchBarRes extends StatefulWidget {
//   final Color? borderColor;
//   final Color? iconColor;
//   final Color? hintColor;
//   final Color? textColor;
//   final VoidCallback? onClose;
//   const SearchBarRes(
//       {Key? key,
//         this.borderColor,
//         this.iconColor,
//         this.hintColor,
//
//         this.textColor, this.onClose})
//       : super(key: key);
//
//   @override
//   State<SearchBarRes> createState() => _SearchBarResState();
// }
//
// class _SearchBarResState extends State<SearchBarRes> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final searchProvider = Provider.of<SearchViewModel>(context , listen: false) ;
//     return SizedBox(
//       width: 280.w,
//       height: 50.h,
//       child: TypeAheadField(
//         suggestionsBoxDecoration: SuggestionsBoxDecoration(
//             constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height / 4)),
//         hideOnEmpty: true,
//         hideSuggestionsOnKeyboardHide: false,
//         keepSuggestionsOnSuggestionSelected: true,
//         hideOnLoading: true,
//         textFieldConfiguration: TextFieldConfiguration(
//             style: TextStyle(
//               color: widget.textColor ?? ColorManager.black,
//               fontFamily: "Cairo",
//               fontWeight: FontWeight.w400,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               suffixIcon: GestureDetector(onTap: (){
//                 widget.onClose!();
//               },
//                 child: Icon(Icons.close , color: ColorManager.primaryColor,) ,),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.r),              ),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.r),
//                   borderSide: BorderSide.none),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.r),
//                   borderSide: BorderSide.none),
//               fillColor: ColorManager.white,
//               prefixIconConstraints: const BoxConstraints(),
//               prefixIcon: const Padding(
//                 padding: const EdgeInsets.only(right: 15.0, left: 15.0),
//                 child: Icon(Icons.search,
//
//
//                     color: ColorManager.primaryColor),
//               ),
//               hintStyle: TextStyle(
//                   fontFamily: "Cairo",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15.h,
//                   color: ColorManager.black),
//               hintText:"search",
//               // contentPadding: const EdgeInsets.only(
//               //     left: 16, right: 16.0, top: 0, bottom: 0),
//             ),
//             onSubmitted: (String value) async {
//
//                 await searchProvider.search(context: context , search: value) ;
//             }),
//
//
//
//
//         suggestionsCallback: (String? pattern) {
//           final searchItemsProvider = Provider.of<SearchViewModel>(context , listen: false );
//           searchItemsProvider.search(context: context , search: pattern , isClear: true);
//           return searchItemsProvider.roomsList != null ? [searchItemsProvider.roomsList] : [] ;
//         },
//         itemBuilder: (BuildContext context, itemData) {
//           final searchItemsProvider = Provider.of<SearchViewModel>(context , listen: true );
//           print(searchItemsProvider.roomsList?.users?.toList());
//           return searchItemsProvider.isLoading? Container(
//             padding: EdgeInsets.all(8.h),
//             decoration: BoxDecoration(
//               color:  ColorManager.white ,
//               borderRadius: BorderRadius.circular(16.r) ,
//
//             ),
//             child: Column(
//               children: List.generate(8, (index) => Shimmer.fromColors(
//                 baseColor: ColorManager.greyColorB8C0D2,
//                 highlightColor: ColorManager.homeCanvasColor,
//                 child: Row
//                   (
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(155.r) ,
//                       child: CustomShimmerImage(image: "" , height: 30.h , width: 30.h,),
//                     ) ,
//                     Text("Name")
//                   ],
//                 ),
//               )),
//             ),
//           ) : Container(
//             padding: EdgeInsets.all(8.h),
//             decoration: BoxDecoration(
//               color:  ColorManager.white ,
//               borderRadius: BorderRadius.circular(16.r) ,
//
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 searchItemsProvider.roomsList != null && searchItemsProvider.roomsList!.users != null && searchItemsProvider.roomsList!.users!.isNotEmpty ? CustomText(text: "Friends:" , textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   color: ColorManager.primaryColor ,
//                   fontSize: 20.h ,
//                 ),)  : const SizedBox(),
//                 searchItemsProvider.roomsList != null
//                     && searchItemsProvider.roomsList!.users != null
//                     && searchItemsProvider.roomsList!.users!.isNotEmpty ?VerticalSpace(10.h)  : const  SizedBox(),
//                 searchItemsProvider.roomsList != null
//                     && searchItemsProvider.roomsList!.users != null
//                     &&searchItemsProvider.roomsList!.users!.isNotEmpty ? Column(
//                   children: List.generate(searchItemsProvider.roomsList!.users!.length  > 4 ? 4 :searchItemsProvider.roomsList!.users!.length , (index) =>
//                       Padding(padding: EdgeInsets.all(10.h) , child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(155.r) ,
//                             child: CustomShimmerImage(image: "${searchItemsProvider.roomsList?.users?[index].image}" , height: 30.h , width: 30.h,),
//                           ) ,
//                           HorizontalSpace(10.w) ,
//                           CustomText(text: "${searchItemsProvider.roomsList?.users?[index].name}" , textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
//                               fontSize: 18.h
//                           ),) ,
//                         ],
//                       ) ,
//
//                       SendRequest(
//                         userId: int.parse(searchItemsProvider.roomsList!.users![index].userId!),
//                       )
//                     ],
//                   ),)),
//                 )  : const  SizedBox(),
//                 VerticalSpace(10.h) ,
//                 searchItemsProvider.roomsList != null
//                     && searchItemsProvider.roomsList!.rooms != null
//                     && searchItemsProvider.roomsList!.rooms!.isNotEmpty ? CustomText(text: "Rooms:" , textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   color: ColorManager.primaryColor ,
//                   fontSize: 20.h ,
//                 ),)  : SizedBox(),
//
//                 searchItemsProvider.roomsList != null
//                     && searchItemsProvider.roomsList!.rooms != null
//                     && searchItemsProvider.roomsList!.rooms!.isNotEmpty ?  Column(
//                   children: List.generate(searchItemsProvider.roomsList!.rooms!.length  > 4 ? 4 :searchItemsProvider.roomsList!.rooms!.length , (index) => Padding(padding: EdgeInsets.all(10.h) , child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(155.r)  ,
//                         child: CustomShimmerImage(image: "${searchItemsProvider.roomsList?.rooms?[index].roomImage}" , height: 30.h , width: 30.h,),
//                       ) ,
//                       HorizontalSpace(10.w) ,
//           CustomText(text: "${searchItemsProvider.roomsList?.rooms?[index].roomName}" , textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
//           fontSize: 18.h
//           ),) ,
//                     ],
//                   ),)),
//                 )  : const SizedBox(),
//               ],
//             ),
//
//           );
//         },
//         onSuggestionSelected: (Object? suggestion) {},
//       ),
//     );
//   }
// }
//
// class SendRequest extends StatelessWidget {
//   final int userId ;
//   const SendRequest({
//     super.key, required this.userId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final sendFriendRequestProvider = Provider.of<SendFriendsRequestsViewModel>(context , listen: true) ;
//     return TapEffect(onClick: ()async{
//       await sendFriendRequestProvider.sendFriendRequest(context: context, user: userId);
//     }, child:
//
//     !sendFriendRequestProvider.isLoading ?Container(
//       height: 30.h,
//       width: 30.h,
//       decoration: BoxDecoration(
//         color: ColorManager.primaryColor ,
//         borderRadius: BorderRadius.circular(8.h) ,
//       ),
//       child: const Center(
//         child: Icon(Icons.add , color: ColorManager.white,weight: 30,),
//       ),
//     ): MyProgressIndicator(
//         size: 20.h,
//
//     )) ;
//   }
// }
//
