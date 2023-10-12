
import '../../../main_index.dart';
import '../../../settings/presentation/bloc/locale_cubit.dart';
import '../../../settings/presentation/bloc/locale_state.dart';

class ChangeLanguagePopup extends BaseStatelessWidget {
  final EdgeInsetsGeometry? margin;
  ChangeLanguagePopup({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [
      strings.english,
      strings.arabic,
    ];
    return Container(
        clipBehavior: Clip.antiAlias,
        width: 70,
        margin: margin ?? EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: Decorations.kDecorationOnlyRadius(color: Colors.transparent, radius: 20),
        child: BlocBuilder<LocaleCubit, LocalState>(
          bloc: LocaleCubit()..getLanguageData(),
          builder: (context, state) {
  return DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            value: state.language == 'en' ? 0 : 1,
            isDense: true,
            borderRadius: BorderRadius.circular(10),
            alignment: AlignmentDirectional.center,
            dropdownColor: Colors.transparent,
            padding: EdgeInsets.zero,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              labelStyle: context.labelLarge.copyWith(fontSize: 20),
              hintStyle: context.labelLarge.copyWith(fontSize: 20),
              contentPadding: 20.paddingBottom,
              border: InputBorder.none,
              prefix: Padding(
                padding: 20.paddingTop,
                child: AppIcon(icon: AppIcons.arrow_down, size: 10, padding: 0.paddingTop),
              ),
              isDense: true,
              // constraints: BoxConstraints(
              //   minHeight: 30,
              //   minWidth: 30,
              // ),
            ),
          //  icon: AppIcon(icon: AppIcons.drop_down, size: 10, padding: 5.paddingTop),
            iconSize: 0,
            items: items.map((e) =>  DropdownMenuItem(
              value: items.indexOf(e),
              alignment: AlignmentDirectional.center,
              child: Text(e, style: context.labelMedium),
            )).toList(),
            onChanged: (value){
              print('value $value');
              if(value == 0){
                context.read<LocaleCubit>().setLanguageData('en');
              }else{
                context.read<LocaleCubit>().setLanguageData('ar');
              }
            },
          ),
        );
  },
),
      );
  }
}

