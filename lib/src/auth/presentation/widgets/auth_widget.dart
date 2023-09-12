
import '../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../main_index.dart';

class AuthWidget extends BaseStatelessWidget {
  final String title;
  final Widget representative;
  final Widget agent;
  AuthWidget({Key? key, required this.title, required this.representative, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   child: Text(title, style: theme.textTheme.titleLarge!.copyWith(fontSize: 22)),
          // ),
          // Expanded(
          //   child: TabBarWidget(
          //
          //     tabs: [
          //       TabItemModel(
          //         label: strings.as_representative,
          //         page:  representative,
          //       ),
          //       TabItemModel(
          //         label: strings.as_agent,
          //         page:  agent,
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
