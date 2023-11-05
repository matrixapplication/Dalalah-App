import '../../src/main_index.dart';

showAlertDialog({
  required BuildContext context,
  required Widget content,
  bool barrierDismissible = false, // user must tap button!
  List<Widget>? actions,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black87,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        insetPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsetsDirectional.all(0),
        content: content,
        actions: actions,
      );
    },
  );
}