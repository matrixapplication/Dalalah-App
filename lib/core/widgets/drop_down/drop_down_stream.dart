import 'package:flutter/material.dart';

import '../../commen/common_state.dart';
import 'drop_down.dart';

class DropDownStream extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? valueId;
  final StreamStateInitial<List<DropDownItem>> stream;
  final void Function(int) onChanged;
  final bool isValidator;

  const DropDownStream(
      {Key? key,
      this.title,
      this.hint,
      required this.stream,
      required this.onChanged,
      this.isValidator = true,
      this.valueId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<List<DropDownItem>>(
        stream: stream.stream,
        builder: (context, snapshot) {
          return (snapshot.data == null || snapshot.data!.isEmpty)
              ? const SizedBox.shrink()
              : DropDownField(
                  title: title,
                  hint: hint,
                  valueId: valueId,
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                  items: snapshot.data ?? [],
                  onChanged: (value) {
                    onChanged.call(int.parse(value?.id ?? '0'));
                  },
                );
        });
  }
}
