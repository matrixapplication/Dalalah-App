
import '../../../main_index.dart';
import 'settings_screen.dart';

class SettingsPage extends BaseStatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.settings,
        body: SettingsScreen());
  }
}
