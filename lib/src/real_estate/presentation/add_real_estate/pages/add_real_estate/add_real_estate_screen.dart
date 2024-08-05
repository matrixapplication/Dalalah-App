import 'package:dalalah/src/main_index.dart';
import '../../../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../../../core/widgets/radio/radio_grid_list.dart';
import '../../../../../../core/widgets/buttons/stack_button.dart';
import '../../../../../../core/widgets/choose_from_list_widget.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../bloc/real_estate_categories_state.dart';
import '../../widgets/input_widget.dart';

class AddRealStateScreen extends BaseStatelessWidget {
  final RealEstateCategoriesState state;
  final StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails;
  final Function(int id)? onGetDetailsType;
  final Function(AddRealEstateParams params, String categoryName)? onTapNext;
  AddRealStateScreen({
    super.key,
    this.onTapNext,
    required this.state,
    this.onGetDetailsType,
    required this.categoriesDetails,
  });

  String type = 'sell';
  String status = 'residential';

  String categoryName = '';
  int categoryId = 0;
  List<DetailsItemModelDto> detailsList = [];

  @override
  Widget build(BuildContext context) {
    categoryId=state.realEstateCategoriesList[0].id??0;
    categoryName=state.realEstateCategoriesList[0].name??'';
    List<DropDownItem> items = [
      DropDownItem(id: '1', title: strings.exist),
      DropDownItem(id: '2', title: strings.not_exist),
    ];

    return StackButton(
      onNextPressed: () {
        AddRealEstateParams addRealEstateParams = AddRealEstateParams(
            type: type,
            status: status,
            categoryId: categoryId,
            detailsList: detailsList);
        onTapNext!(addRealEstateParams, categoryName);
      },
      child: SingleChildScrollView(
        padding: 16.paddingHoriz + 60.paddingTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.ph,
            Text(
              strings.status_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
                radius: 8,
                width: MediaQuery.of(context).size.width * 0.42,
                onChoose: (ChooseItemListModel item) {
                  if (item.id == 2) {
                    type = 'rent';
                  } else {
                    type = 'sell';
                  }
                },
                items: [
                  ChooseItemListModel(
                    id: 1,
                    title: strings.to_sell,
                  ),
                  ChooseItemListModel(id: 2, title: strings.for_rent),
                ]),
            16.ph,
            Text(
              strings.status_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
                radius: 20,
                width: MediaQuery.of(context).size.width * 0.42,
                onChoose: (ChooseItemListModel item) {
                  if (item.id == 2) {
                    status = 'commercial';
                  } else {
                    status = 'residential';
                  }
                },
                items: [
                  ChooseItemListModel(
                    id: 1,
                    title: strings.residential,
                  ),
                  ChooseItemListModel(id: 2, title: strings.commercial),
                ]),
            16.ph,
            Text(
              strings.type_real_estate,
              style: titleSmall,
            ),
            ChooseFromListItemWidget(
              onChoose: (ChooseItemListModel item) {
                onGetDetailsType!(item.id);
                categoryId = item.id;
                categoryName = item.title;
              },
              items: state.realEstateCategoriesList
                  .map(
                      (e) => ChooseItemListModel(id: e.id!, title: e.name!))
                  .toList(),
            ),
            16.ph,
            StreamBuilder<RealEstateCategoryDetailsDto?>(
                stream: state.categoriesDetailsStream.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return snapshot.connectionState ==
                      ConnectionState.waiting ||
                      data == null
                      ? const LoadingView()
                      : Column(
                    children: [
                      ...categoriesDetails.data!.details!.map((e) {
                        if (e.type == 'input') {
                          return Padding(
                            padding: 8.paddingVert,
                            child: InputWidget(
                              title: e.name ?? '',
                              onChanged: (val) {
                                if (detailsList
                                    .map((w) => w.id == e.id)
                                    .isNotEmpty) {
                                  detailsList.removeWhere((w) => w.id == e.id);
                                  detailsList.add(DetailsItemModelDto(id: e.id, title: val));
                                } else {
                                  detailsList.add(DetailsItemModelDto(id: e.id, title: val));
                                }
                              },
                            ),
                          );
                        } else if (e.type == 'dropdown') {
                          return Padding(
                            padding: 8.paddingVert,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name ?? '',
                                  style: titleSmall,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child:
                                  DropDownField(
                                    hint: '',
                                    items: e.options!
                                        .map((a) => DropDownItem(
                                        id: a.id.toString(),
                                        title: a.name.toString()))
                                        .toList(),
                                    onChanged: (item) {
                                      if (detailsList
                                          .map((w) => w.id == e.id)
                                          .isNotEmpty) {
                                        detailsList.removeWhere(
                                                (w) => w.id == e.id);
                                        detailsList.add(
                                            DetailsItemModelDto(
                                                id: e.id,
                                                title: item!.title!));
                                      } else {
                                        detailsList.add(
                                            DetailsItemModelDto(
                                                id: e.id,
                                                title: item!.title!));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: 8.paddingVert,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name ?? '',
                                  style: titleSmall,
                                ),
                                16.ph,
                                Center(
                                  child: RadioGridList(
                                    items: e.options!
                                        .map((a) => RadioItem(
                                      value: a.id!,
                                      title: a.name ?? '',
                                    ))
                                        .toList(),
                                    groupValue: '1',
                                    onChanged: (RadioItem radio) {
                                      if (detailsList
                                          .map((w) => w.id == e.id)
                                          .isNotEmpty) {
                                        detailsList.removeWhere(
                                                (w) => w.id == e.id);
                                        detailsList.add(
                                            DetailsItemModelDto(
                                                id: e.id,
                                                title: radio.title));
                                      } else {
                                        detailsList.add(
                                            DetailsItemModelDto(
                                                id: e.id,
                                                title: radio.title));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      })
                    ],
                  );
                }),

          ],
        ),
      ),
    );
  }
}
