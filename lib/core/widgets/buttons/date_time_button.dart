import 'package:arabitac/core/utils/helper_methods.dart';
import '../../../src/main_index.dart';

class DateTimeButton extends StatelessWidget {
  final Function(String) onDateSelected;
  const DateTimeButton({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<String> streamStateInitial = StreamStateInitial();
    String data = '';
    return InkWell(
      onTap: () async{
        data  = await HelperMethods.datePicker(context);
        final dataFormat = HelperMethods.formatDate(data);
        streamStateInitial.setData(dataFormat);
        onDateSelected(dataFormat);
      },
      child: StreamBuilder<String>(
        stream: streamStateInitial.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Text(snapshot.data!, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12)) :
            const AppIcon(
            icon: AppIcons.dateTime,
          );
        }
      ),
    );
  }
}
