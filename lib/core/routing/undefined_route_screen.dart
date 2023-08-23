
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UndefinedRouteScreen extends StatelessWidget {
  final String? name;
  const UndefinedRouteScreen(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Not found route",
              style: TextStyle(),
            ),
            if (kDebugMode) Text(name ?? "null",),
          ],
        ),
      ),
    );
  }
}
