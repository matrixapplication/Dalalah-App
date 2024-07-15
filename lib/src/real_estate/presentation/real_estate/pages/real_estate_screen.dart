import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../core/widgets/tabview/custom_tabbar_widget.dart';
import '../../../../home/presentation/widgets/filter_home.dart';
import '../../../domain/entities/real_estate.dart';
import '../widgets/custom_real_estate_list.dart';
import '../widgets/search_rael_estate.dart';

class RealEstateScreen extends BaseStatelessWidget {
  final List<Notifications> notifications;

  RealEstateScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String filterOrder = FilterOrderTypes.asc;
    TextStyle? textStyle = context.textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        color: Colors.black54
    );
    return
        Scaffold(
          body:
            Column(
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
                                  hint: 'للبيع',
                                  valueId: 5,
                                  items: items1.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
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
                                  hint: 'شقة',
                                  valueId: 5,
                                  items: items1.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
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
                                  hint: 'Price',
                                  valueId: 5,
                                  items: items1.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                                  onChanged: (item) {
                                    // brandId = int.parse(item?.id ?? '0');
                                    // onFetchBrandModels?.call(brandId);
                                  },
                                ),
                              ),
                              5.pw,
                              SizedBox(
                                width: 170,
                                child: DropDownField(
                                  hint: 'غرف النوم والحمامات',
                                  valueId: 5,
                                  items: items1.map((e) => DropDownItem(id: e.id.toString(), title: e.title.toString())).toList(),
                                  onChanged: (item) {
                                    // brandId = int.parse(item?.id ?? '0');
                                    // onFetchBrandModels?.call(brandId);
                                  },
                                ),
                              ),
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
                                page: CustomRealEstateListWidget(),
                              ),
                              TabItemModel(
                                label: 'الخريطة',
                                page: CustomRealEstateListWidget(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        );
  }

  List<DropDownItem> items1 = [
    const DropDownItem(id: '1', title: 'first'),
    const DropDownItem(id: '2', title: 'second'),
    const DropDownItem(id: '3', title: 'third'),
  ];
}