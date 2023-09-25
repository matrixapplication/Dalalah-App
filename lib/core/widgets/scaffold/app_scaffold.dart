import 'package:arabitac/src/main_index.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? resizeToAvoidBottomInset;

  const AppScaffold(
      {Key? key,
      this.title,
      required this.body,
      this.floatingActionButton,
      this.isDrawer = true,
      this.appBar,
      this.backgroundAppBar,
      this.bottomSheet,
      this.bottomNavigationBar,
      this.backgroundColor,
      this.actions,
      this.titleStyle,
      this.foregroundColor,
      this.leading,
      this.resizeToAvoidBottomInset,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('resizeToAvoidBottomInset: $resizeToAvoidBottomInset ');
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset, // this code remove the keyboard overflow.
     // drawer: isDrawer! ? SideMenuPage(isCaptain: true) : null,
      //SafeArea to save content from the phone top par.
      body: body,
      // extendBody: true,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: (title == null && appBar == null)
          ? null
          : appBar ??
              AppBar(
                title: Text(title ?? '',
                    style: titleStyle ?? theme.appBarTheme.titleTextStyle),
                backgroundColor:
                    backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                foregroundColor: foregroundColor ?? theme.appBarTheme.foregroundColor,
                actions: actions ?? [],
                leadingWidth: 83,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                  statusBarBrightness: Brightness.light,
                ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(1),
                    child: Divider(height: 1, thickness: 1, color: context.dividerColor),
                  ),
                // leading: leading != null
                //     ? Padding(
                //         padding: const EdgeInsets.only(right: 5),
                //         child: Row(
                //           children: [
                //             if (isDrawer!)
                //               AppIconButton(
                //                 icon: AppIcons.menu,
                //                 size: 28,
                //                 color: theme.cardColor,
                //                 onPressed: () {
                //                   globalKey.currentState?.openDrawer();
                //                 },
                //               ),
                //             leading!,
                //           ],
                //         ),
                //       )
                //     : isDrawer!
                //         ? AppIconButton(
                //             icon: AppIcons.menu,
                //             padding: const EdgeInsets.only(left: 22, top: 18, bottom:5,),
                //             color: theme.cardColor,
                //             size: 15,
                //             onPressed: () {
                //               globalKey.currentState?.openDrawer();
                //             },
                //           )
                //         : null,
              ),
    );
  }
}
