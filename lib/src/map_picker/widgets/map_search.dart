
import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../core/widgets/text-field/custom_text_field.dart';
import '../../main_index.dart';
import 'map_prediction.dart';

///  Created by harbey on 9/12/2023.
class MapSearch extends BaseStatelessWidget {
  final Function(String) onSearch;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  Function(MapPrediction) onSelectPlace;

  MapSearch(
      {Key? key,
      required this.onSearch,
      required this.predictionsSearchStream,
      required this.onSelectPlace});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.ph,
          CustomBackButton(),
          CustomTextField(
            controller: searchController,
            suffixIcon: const Icon(Icons.search),
            onChanged: (value) {
              print('asasc ${value}');
              if (value.isNotEmpty) {
                onSearch(value);
              }
            },
          ),
          Expanded(
            child: StreamBuilder<List<MapPrediction>?>(
                stream: predictionsSearchStream.stream,
                builder: (context, snapshot) {
                  print('onStreamBuilder ${snapshot.hasData}');
                  return (snapshot.data != null && snapshot.data!.isNotEmpty)
                      ? Container(
                   height: MediaQuery.of(context).size.height * 0.4,
                    // margin: 8.paddingTop,
                    padding: 16.paddingVert,
                    decoration: Decorations.kDecorationOnlyRadius(radius: 15, color: context.cardColor),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        padding: 0.paddingAll,
                        itemBuilder: (con, pos) {
                          final item = snapshot.requireData![pos];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                searchController.text = item.description!;
                                predictionsSearchStream.setData([]);
                                onSelectPlace(item);
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item.description.toString(),
                                    maxLines: 2,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                      : Container();
                }),
          )
        ],
      ),
    );
  }
}
