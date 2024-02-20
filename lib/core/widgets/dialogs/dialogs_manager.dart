import 'package:flutter/services.dart';
import '../../../main.dart';
import '../../utils/navigator.dart';
import 'progress_dialog.dart';
import '../../../src/main_index.dart';

class DialogsManager {
  static CustomProgressDialog createProgress() {
    return ProgressDialog.createProgress(
        navigatorMainKey.currentContext!);
  }

  static showAlertDialog(BuildContext context, Widget content) {
    AlertDialog alert = AlertDialog(
      content: Container(
        child: content,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static onBackPress(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static baseDialog(
      BuildContext context, {
        String? confirmButtonName,
        required String message,
        Function()? onClickOk,
        bool? dismissible = true,
        Function()? negativeTap,
        required IconData icon,
        String? negativeButtonName,
        bool hideCancelButton = true,
      }) {
    showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Icon(icon,
              size: 60,
              color: icon == Icons.error
                  ? Colors.red
                  : (icon == Icons.info ? Colors.orange : Colors.green)),
          content: WillPopScope(
            onWillPop: () async {
              return dismissible == true;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: context.bodySmall.copyWith(fontSize: 14), textAlign: TextAlign.center),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (onClickOk != null) {
                  onClickOk();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                confirmButtonName ?? context.strings.ok,
                style: context.bodyLarge.copyWith(
                    color: context.primaryColor, fontSize: 14),
              ),
            ),
            hideCancelButton == true
                ? const SizedBox.shrink()
                : TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (negativeTap != null) {
                  negativeTap();
                }
              },
              child: Text(
                negativeButtonName ?? context.strings.cancel,
                style:
                context.bodyLarge.copyWith(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }


  static showSuccessDialog(BuildContext context,
      {required String message, Function()? onClickOk}) {
    return baseDialog(context,
        message: message, icon: Icons.check_circle, onClickOk: ()=> onClickOk!());
  }

  static showInfoDialog(BuildContext context,
      {required String message, Function()? onClickOk}) {
    return baseDialog(context,
        message: message, icon: Icons.info, onClickOk: onClickOk, hideCancelButton: false);
  }

  static showErrorDialog(BuildContext context, String text) {
    baseDialog(
      context,
      message: text,
      icon: Icons.error,
    );
  }

  // show info dialog to login
  static showInfoDialogToLogin() {
    BuildContext context = injector<ServicesLocator>().navigatorKey.currentContext!;
    baseDialog(
      context,
      message: context.strings.you_must_login_first,
      icon: Icons.login,
      hideCancelButton: false,
      confirmButtonName: context.strings.login,
      onClickOk: () {
        pushNamed(Routes.login);
      },
    );
  }
}
