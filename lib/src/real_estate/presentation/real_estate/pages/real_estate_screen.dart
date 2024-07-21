import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/pagination/loading_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/components/loading_widget.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../core/widgets/tabview/custom_tabbar_widget.dart';
import '../../../../home/presentation/widgets/filter_home.dart';
import '../../../data/models/category_details_dto.dart';
import '../../../data/models/real_estate_model.dart';
import '../../../data/models/real_estate_type_dto.dart';
import '../../../domain/entities/real_estate.dart';
import '../widgets/custom_real_estate_list.dart';
import '../widgets/search_rael_estate.dart';

class RealEstateScreen extends BaseStatelessWidget {
  final StreamStateInitial<List<RealEstateCategoryDto>?> realEstateCategoriesList;
  final StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails;
  final Function(int id)? onGetDetailsType;
  final StreamStateInitial<RealEstatesModel?>  realEstatesData;
  RealEstateScreen( {Key? key,  required this.realEstatesData,required this.realEstateCategoriesList, required this.categoriesDetails, this.onGetDetailsType,}) : super(key: key);
  String categoryName='';
  int categoryId=0;
  @override
  Widget build(BuildContext context) {
    String filterOrder = FilterOrderTypes.asc;
    TextStyle? textStyle = context.textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        color: Colors.black54
    );
    return Column(
        children: [
          SearchRealEstate(
            onSearch: (ca) {},
            onToggleFavorite: (onToggleFavorite) {},
          ),
          Expanded(
            child: Padding(
              padding: 16.paddingHoriz,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: DropDownField(
                            valueId: 1,
                            items: typeList(context).map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                            onChanged: (item) {
                              // brandId = int.parse(item?.id ?? '0');
                              // onFetchBrandModels?.call(brandId);
                            },
                          ),
                        ),
                        5.pw,
                        SizedBox(
                          width: 100,
                          child: DropDownField(
                            valueId: 1,
                            items: statusList(context).map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                            onChanged: (item) {
                              // brandId = int.parse(item?.id ?? '0');
                              // onFetchBrandModels?.call(brandId);
                            },
                          ),
                        ),
                        5.pw,
                        StreamBuilder<List<RealEstateCategoryDto>?>(
                            stream: realEstateCategoriesList.stream,
                            builder: (context, snapshot) {
                              final data = snapshot.data;
                              return SizedBox(
                                width: 100,
                                child: DropDownField(
                                  hint: (data != null && data.isNotEmpty) ? data[0].name ?? '' : '',
                                  isLoading: snapshot.data==null,
                                  items: data?.map((e) => DropDownItem(id: e.id.toString(), title: e.name?.toString()??'')).toList() ?? [],
                                  onChanged: (item) {
                                    onGetDetailsType!(int.parse(item?.id??''));
                                    categoryId=int.parse(item?.id??'');
                                    categoryName=item?.title??'';
                                  },
                                ),
                              );
                            }),
                        5.pw,
                        StreamBuilder<RealEstateCategoryDetailsDto?>(
                            stream: categoriesDetails.stream,
                            builder: (context, snapshot) {
                              final data = snapshot.data?.details;
                              return snapshot.connectionState == ConnectionState.waiting
                                  ||data==null
                                  ? const SmallLoading()
                                  :
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...categoriesDetails.data!.details!.map((e) {
                                      if(e.type!='input'){
                                        return Padding(
                                          padding: 3.paddingHoriz,
                                          child: SizedBox(
                                            width: 100,
                                            child: DropDownField(
                                              hint: e.name??'',
                                              items: e.options?.map((a) => DropDownItem(id: a.id.toString(), title: a.name?.toString()??'')).toList()??[],
                                              onChanged: (item) {
                                                // brandId = int.parse(item?.id ?? '0');
                                                // onFetchBrandModels?.call(brandId);
                                              },
                                            ),
                                          ),
                                        );
                                      }else{
                                        return const SizedBox();
                                      }

                                    })
                                  ],
                                ),
                              );
                            }),

                      ],
                    ),
                  ),
                  16.ph,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '58 عقار',
                          style: context.textTheme.displaySmall!.copyWith(
                            color: AppColors.grey_95,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return IconTextButton(
                              icon: filterOrder == FilterOrderTypes.asc
                                  ? AppIcons.filter_order
                                  : AppIcons.filter_order,
                              text: context.strings.sort_by,
                              textStyle: textStyle,
                              iconColor: context.primaryColor,
                              iconSize: 20,
                              isFirstIcon: false,
                              onTap: () {
                                filterOrder = filterOrder == FilterOrderTypes.asc
                                    ? FilterOrderTypes.desc
                                    : FilterOrderTypes.asc;
                                setState(() {
                                  // onFilterOrder(filterOrder);
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  16.ph,
                  Expanded(
                    child: CustomTabItemModel(
                      tabs: [
                        TabItemModel(
                          label: 'القوائم',
                          page: CustomRealEstateListWidget(realEstatesData: realEstatesData,),
                        ),
                        TabItemModel(
                          label: 'الخريطة',
                          page: CustomRealEstateListWidget(realEstatesData: realEstatesData,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }

  List<DropDownItem> typeList (context) => [
     DropDownItem(id: '1', title: strings.to_sell),
     DropDownItem(id: '2', title: strings.for_rent),
  ];
  List<DropDownItem> statusList (context) => [
    DropDownItem(id: '1', title: strings.residential),
    DropDownItem(id: '2', title: strings.commercial),
  ];

}