import '../../../../core/widgets/list-tile/custom_list_tile2.dart';
import '../../../main_index.dart';
import '../bloc/locale_cubit.dart';
import '../bloc/locale_state.dart';

class SettingsScreen extends BaseStatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.change_language,
            style: theme.textTheme.bodyLarge,
          ),
          Container(
            margin: 10.paddingTop,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: Decorations.kDecorationRadius(
              color: context.cardColor,
              radius: 8,
            ),
            child: BlocBuilder<LocaleCubit, LocalState>(
                bloc: LocaleCubit()..getLanguageData(),
                builder: (context, state) {
                return Column(
                  children: [
                    RadioListTile(
                      value: 'ar',
                      title: Text(
                        strings.arabic,
                        style: theme.textTheme.bodyMedium,
                      ),
                      groupValue: state.language,
                      onChanged: (value) {
                        context.read<LocaleCubit>().setLanguageData(value.toString());
                      },
                    ),
                    RadioListTile(
                      value: 'en',
                      title: Text(
                        strings.english,
                        style: theme.textTheme.bodyMedium,
                      ),
                      groupValue: state.language,
                      onChanged: (value) {
                        print('value $value');
                        context.read<LocaleCubit>().setLanguageData(value.toString());
                      },
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
