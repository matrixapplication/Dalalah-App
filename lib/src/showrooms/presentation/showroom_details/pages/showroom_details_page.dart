import 'package:dalalah/core/widgets/buttons/row_buttons.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/rating/custom_rating_bar.dart';
import '../../../data/models/add_rate_params.dart';
import '../../../domain/entities/showroom.dart';
import '../bloc/showrooms_details_bloc.dart';
import 'showroom_details_screen.dart';

class ShowroomDetailsPage
    extends BaseBlocWidget<DataSuccess<Showroom>, ShowroomDetailsCubit> {
  ShowroomDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchShowroomDetails(id);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Showroom> state) {
    return ExhibitionDetailsScreen(
      showroom: state.data ?? Showroom(),
      onAddRate: () {
        showAddRateDialog(state.data?.id ?? 0);
      },
      onFollow: () {
        bloc.addFollowShowrooms(state.data?.id ?? 0);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    return "التجار و المعارض";
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context!);
  }

  showAddRateDialog(int id) async {
    double rate = 3;
    bool isUser = await HelperMethods.isUser();
    if (isUser) {
      showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          titlePadding: 10.paddingAll,
          title: Text(
            strings.showroom_evaluation,
            style: context.bodyMedium.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRatingBar(
                initialRating: rate,
                itemSize: 35,
                icon: AppIcons.rate_star,
                iconColor: context.yellow_03,
                ignoreGestures: false,
                padding: 2.paddingAll,
                onRating: (value) {
                  rate = value;
                },
              ),
            ],
          ),
          actions: [
            RowButtons(
              title1: strings.add,
              title2: strings.cancel,
              onPressed1: () {
                Navigator.pop(context);
                bloc.addRateShowroom(AddRateParams(
                  rate: rate.toInt(),
                  showroomId: id,
                ));
              },
              onPressed2: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }
}
