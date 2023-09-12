import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [],
      ),
    );
  }

  checkIfUserRole(List<String> useRolesArray, String? userRole) {
    if (userRole != null && useRolesArray.contains(userRole)) {
      return true;
    }
    return false;
  }
}

class WidgetWithDivider extends StatelessWidget {
  final Widget child;

  const WidgetWithDivider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Divider(), child],
    );
  }
}
