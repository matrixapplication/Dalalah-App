
import '../../../main_index.dart';
import '../../domain/entities/invoice.dart';

class InvoiceItem extends StatelessWidget {
  final Invoice invoice;
  const InvoiceItem({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    StreamState<bool> expandedStream = StreamStateInitial();
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        color: theme.colorScheme.background,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:  const BorderSide(color: kDividerColor, width: 1.5)
        ),
        elevation: 0,
        child: ExpansionTile(
          title: Text(invoice.date, style: theme.textTheme.displayLarge),
          collapsedBackgroundColor: theme.colorScheme.background,
          // collapsedShape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(12),
          // ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(12),
          // ),
          backgroundColor: theme.colorScheme.background,
          trailing: StreamBuilder<bool>(
              stream: expandedStream.stream,
              builder: (context, snapshot) {
                return AppIcon(
                  icon:
                  (snapshot.data ?? false) ? AppIcons.topArrow :
                  AppIcons.bottomArrow,
                  color: kGreyColor,
                  size: 9,
                );
              }
          ),
          onExpansionChanged:  (value){
            expandedStream.setData(value);
          },
          children: invoice.details.map((e) =>  Column(
            children: [
              const Divider(thickness: 1),
              ListTile(
                  title: Text(e.title, style: theme.textTheme.displayMedium),
                  tileColor: theme.colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIconButton(
                        icon: AppIcons.pdf,
                        color: theme.colorScheme.errorContainer,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      AppIconButton(
                        icon: AppIcons.download,
                        color: kGreyColor,
                        onPressed: () {},
                      ),
                    ],
                  )
              ),
            ],
          )).toList(),
        ),
    );
  }
}
