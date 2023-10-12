import 'package:delala/src/main_index.dart';
import '../../widgets/search_home.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: context.height * 0.4,
              width: double.infinity,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF023947), Color(0xFF025F77)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              height: context.height * 0.5,
              width: double.infinity,
              color: context.cardColor,
            ),
          ],
        ),
        HomeScreen(),

      ],
    );
  }
}
