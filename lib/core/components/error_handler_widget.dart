import 'package:dalalah/core/widgets/buttons/primary_icon_button.dart';

import '../exceptions/api_exception.dart';
import '../utils/navigator.dart';
import '/src/main_index.dart';

// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends StatelessWidget {
  final String? error;
  final String? title;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage;

  final double? height;

  ErrorPlaceHolderWidget(
      {Key? key,
      this.error,
      this.exception,
      this.title,
      this.onClickReload,
      this.showImage = true,
      this.color,
      this.height,
      this.placeHolderImage})
      : super(key: key);
  Widget? placeHolderImage;

  String? message;

  @override
  Widget build(BuildContext context) {
    ApiException error = context.handleApiError(exception: exception);
    bool isUnAuthorized = error.code == 401;
    return Container(
      color: color ?? Colors.white,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            placeHolderImage != null && showImage
                ? Container(
                    color: color ?? Colors.white,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: placeHolderImage,
                  )
                : Container(),
            title != null
                ? Text(
                    title!,
                    style:
                        kTextMedium.copyWith(color: kPrimaryDark, fontSize: 12),
                  )
                : Container(),
            Text(
              error.message ?? message.toString().trim(),
              style: kTextRegular.copyWith(color: kPrimaryDark, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            20.ph,
            PrimaryIconButton(
              icon: isUnAuthorized ? AppIcons.login : AppIcons.refresh,
              iconColor: context.cardColor,
              title: isUnAuthorized
                  ? context.strings.login
                  : context.strings.reload,
              backgroundColor:
                  isUnAuthorized ? context.errorColor : context.primaryColor,
              width: 100,
              radius: 50,
              onPressed: () {
                if (isUnAuthorized) {
                  Navigators.pushNamedAndRemoveUntil(Routes.login);
                } else {
                  onClickReload!();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
