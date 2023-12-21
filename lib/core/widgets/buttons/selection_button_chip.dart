import 'package:dalalah/src/main_index.dart';

class SelectionButtonChip extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final List<ChipItem> types;
  final EdgeInsetsGeometry? padding;
  final void Function(ChipItem)? onSelected;
  final bool isScrollableGrid;

  SelectionButtonChip({
    Key? key,
    this.title,
    this.initialValue,
    required this.types,
    this.onSelected,
    this.padding,
    this.isScrollableGrid = true,
  }) : super(key: key);

  ChipItem? selectedType;

  @override
  Widget build(BuildContext context) {
    _initialValue();
    return Padding(
      padding: 8.paddingVert,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: context.bodySmall,
          ),
          5.ph,
          StatefulBuilder(
            builder: (context, setState) {
              return isScrollableGrid
                  ? _buildChipsGrid(context, setState)
                  : _buildChips(context, setState);
              // : Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: types
              //         .map((item) => Expanded(
              //               child: SelectItem(
              //                 item: item,
              //                 types: types,
              //                 setState: setState,
              //                 selectedType: selectedType ?? types.first,
              //                 onSelected: (bool value) {
              //                   setState(() {
              //                     selectedType = item;
              //                     onSelected!(value);
              //                   });
              //                 },
              //                 padding: padding,
              //               ),
              //             ))
              //         .toList(),
              //   );
            },
          ),
        ],
      ),
    );
  }

  _initialValue() {
    selectedType = types.firstOrNull((e) => e.id == initialValue)
        ?? (types.isEmpty ? null : types.first);
    print('selectedType: ${selectedType?.title}');
  }

  Widget _buildChips(
      BuildContext context, void Function(void Function()) setState) {
    return Wrap(
      runSpacing: 10,
      children: types
          .map((e) => SelectItem(
                isWrap: true,
                item: e,
                types: types,
                setState: setState,
                selectedType: selectedType ?? types.first,
                onSelected: (bool value) {
                  setState(() {
                    selectedType = e;
                    onSelected!(selectedType!);
                  });
                },
                padding: padding,
              ))
          .toList(),
    );
  }

  Widget _buildChipsGrid(
      BuildContext context, void Function(void Function()) setState) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: types.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: 0.paddingAll,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: types.length == 1 ? 1 : 2,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => SelectItem(
        item: types[index],
        types: types,
        setState: setState,
        isWrap: false,
        selectedType: selectedType ?? types.first,
        onSelected: (bool value) {
          setState(() {
            selectedType = types[index];
            onSelected!(selectedType!);
          });
        },
        padding: padding,
      ),
    );
  }
}

class ChipItem {
  final String? id;
  final String title;
  final String? icon;

  ChipItem({this.id, required this.title, this.icon});
}

class SelectItem extends StatelessWidget {
  final ChipItem item;
  final List<ChipItem> types;
  final void Function(void Function()) setState;
  final void Function(bool)? onSelected;
  final ChipItem selectedType;
  final EdgeInsetsGeometry? padding;
  final bool isWrap;

  const SelectItem(
      {Key? key,
      required this.item,
      required this.types,
      required this.setState,
      this.onSelected,
      this.padding,
      required this.selectedType,
      this.isWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: row(context, isWrap: isWrap),
      selected: selectedType == item,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      selectedColor: context.primaryColor,
      backgroundColor: context.cardColor,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      side: BorderSide(
        color: selectedType == item
            ? context.secondaryContainer
            : context.hintColor,
        width: 1,
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
      onSelected: onSelected,
    );
  }

  Widget image(BuildContext context) {
    return item.icon?.split('.').last == 'svg'
        ? AppIcon(
            icon: item.icon ?? '',
            color:
                selectedType == item ? context.cardColor : context.primaryColor)
        : Image.network(item.icon ?? '',
            height: 25,
            width: 25,
            color: selectedType == item
                ? context.cardColor
                : context.primaryColor);
  }

  Widget text(BuildContext context) {
    return FittedBox(
      child: Text(
        item.title,
        style: context.textTheme.headlineMedium!.copyWith(
          color: selectedType == item ? context.cardColor : AppColors.grey_41,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget row(BuildContext context, {bool isWrap = false}) {
    return SizedBox(
      width: isWrap ? null : context.width / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: (item.icon != null && item.icon!.isNotEmpty)
            ? MainAxisSize.min
            : MainAxisSize.max,
        children: [
          if (item.icon != null && item.icon!.isNotEmpty) ...[
            image(context),
            10.pw,
          ],
          text(context),
        ],
      ),
    );
  }
}
