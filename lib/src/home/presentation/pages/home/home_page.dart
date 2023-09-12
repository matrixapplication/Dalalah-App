import 'package:arabitac/src/main_index.dart';
import '../../widgets/search_home.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: context.primaryColor,
        title: SearchHome(),
      ),
      body: HomeScreen(),
    );
  }
}
