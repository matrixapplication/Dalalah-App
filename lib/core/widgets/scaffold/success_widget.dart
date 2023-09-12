import '../../../src/main_index.dart';

class SuccessWidget extends BaseStatelessWidget {
  final String title;
  final String message;
  final bool showFooter;
  final String? footerMessage;
  final Function()? onPressed;

  SuccessWidget(
      {Key? key,
      required this.message,
      required this.title,
      this.onPressed,
      this.showFooter = false,
      this.footerMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showFooter)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: Decorations.kDecorationOnlyRadius(
                color: theme.colorScheme.secondaryContainer.withOpacity(0.1), radius: 18),
            child: Text(
              footerMessage!,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: theme.colorScheme.secondaryContainer),
            ),
          ),
        const SizedBox(height: 30),
        const AppIcon(icon: AppIcons.done, size: 100),
        const SizedBox(height: 20),
        Text(message, style: Theme.of(context).textTheme.headlineLarge),
        Spacer(),
        PrimaryButton(
          title: title,
          elevation: 5,
          margin: const EdgeInsets.only(bottom: 30),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
