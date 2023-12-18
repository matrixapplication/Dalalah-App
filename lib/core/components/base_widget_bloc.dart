import '../../src/main_index.dart';
import '../widgets/tabview/animated_tabs_bar.dart';

abstract class BaseBlocWidget<T, B extends BlocBase<DataState>>
    extends BaseStatelessWidget {
  BuildContext? context =
      injector<ServicesLocator>().navigatorKey.currentContext;
  late B bloc;

  BaseBlocWidget({Key? key}) : super(key: key);

  @override
  ThemeData get theme => Theme.of(context!);

  @protected
  Widget buildWidget(BuildContext context, T state);

  void buildListener(BuildContext context, dynamic state) {
    if (state is LoadingStateListener) {
      showProgress();
    } else {
      dismissProgress();
    }

    if (state is FailureStateListener) {
      dismissProgress();
      onRequestFail();
      showErrorDialog(state.error, context);
    }

    if (state is SuccessStateListener<String>) {
      dismissProgress();
      onRequestSuccess(state.data);
    }
    if (state is SuccessStateListener) {
      dismissProgress();
      onSuccessDismissed();
    }
  }

  showProgress() {
    progress.show();
  }

  dismissProgress() {
    progress.dismiss();
  }

  @protected
  void loadInitialData(BuildContext context) {}

  @protected
  String? title(BuildContext context) {
    return null;
  }

  @protected
  bool hasTabBarView(BuildContext context) {
    return false;
  }

  @protected
  bool hasAppBar(BuildContext context) {
    return false;
  }

  @protected
  Widget? leading(BuildContext context) {
    return null;
  }

  // @protected
  // List<TabModel> tabs(BuildContext context) {
  //   return [];
  // }

  // @protected
  // List<Widget> tabViews(BuildContext context) {
  //   return [];
  // }

  @protected
  bool? isNotBack(BuildContext context) {
    return true;
  }

  @protected
  bool hasFilter(BuildContext context) {
    return false;
  }

  @protected
  Color backgroundAppBar(BuildContext context) {
    return context.theme.appBarTheme.backgroundColor!;
  }

  @protected
  bool? resizeToAvoidBottomInset(BuildContext context) {
    return true;
  }
  @protected
  bool isAddButton() {
    return false;
  }

  @protected
  Function()? onAddButtonPressed() {
    return null;
  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return mainFrame(body: buildConsumer(context));
  }

  Widget mainFrame({
    required Widget body,
    List<TabModel>? tabs,
    bool hasFilter = false,
    List<Widget>? tabViews,
    Function(int)? onTabSelected,
    // Widget? leading,
  }) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context!),
      child: AppScaffold(
        hasFilter: hasFilter,
        title: title(context!),
        leading: leading(context!),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context!),
        isDrawer: isNotBack(context!),
        hasAppBar: hasAppBar(context!),
        backgroundColor: theme.scaffoldBackgroundColor,
        backgroundAppBar: backgroundAppBar(context!),
        body: body,
        tabs: tabs,
        onTabSelected: onTabSelected,
        onAddButtonPressed: onAddButtonPressed,
        isAddButton: isAddButton(),
        tabViews: tabViews,
        hasTabBarView: hasTabBarView(context!),
      ),
    );
  }

  _onWillPop(BuildContext context) {
    print('onBackPress');
    if (Navigator.canPop(context)) {
      //onBackPress();
      return Future.value(true);
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  Widget handleUiState(DataState state, BuildContext context) {
    print('handleUiState $T == $state => ${state is T}');
    if (state is DataLoading) {
      return LoadingView();
    }
    if (state is T) {
      return buildWidget(context, state as T);
    }
    if (state is DataFailed) {
      return handleApiErrorPlaceHolder(state.error,
          onClickReload: onClickReload);
    }
    return onBuildUnInitWidget(context);
  }

  Widget onBuildUnInitWidget(BuildContext context) {
    return const Center();
  }

  Widget handleApiErrorPlaceHolder(error, {Function()? onClickReload}) {
    return ErrorPlaceHolderWidget(
      exception: error,
      onClickReload: onClickReload,
    );
  }

  void handleApiError(error,
      {required Function(String message, String code) onHandleMessage}) {
    final errorApi = injector<ServicesLocator>()
        .navigatorKey
        .currentContext!
        .handleApiError(exception: error);
    onHandleMessage(errorApi.code.toString(), "0");
  }

  void showErrorDialog(error, BuildContext context) {
    DialogsManager.showErrorDialog(
        context, context.handleApiErrorMessage(exception: error));
  }

  @protected
  onClickReload() {
    loadInitialData(context!);
  }

  void onRequestFail() {}

  void onSuccessDismissed() {}

  void onRequestSuccess(String? message) {
    if (message != null && message.isNotEmpty) {
      DialogsManager.showSuccessDialog(context!, message: message,
          onClickOk: () {
        Navigator.pop(context!);
        onSuccessDismissed();
      });
    }
  }

  BlocConsumer buildConsumer(BuildContext context) {
    bloc = injector.get<B>();
    this.context = context;
    loadInitialData(context);

    return BlocConsumer<B, DataState>(
        bloc: bloc,
        listenWhen: (state, current) => current is DataStateFListener,
        buildWhen: (state, current) => current is DataStateFBuilder,
        builder: (context, state) => handleUiState(state, context),
        listener: (context, state) => buildListener(context, state));
  }
}
