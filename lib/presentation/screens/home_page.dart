import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/presentation/screens/screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexHomePageProvider);
    final indexIntance = ref.watch(indexHomePageProvider.notifier);
    return SafeArea(
      child: Scaffold(
        body: widgetOptions.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
          currentIndex: index,
          onTap: indexIntance.changeIndex,
        ),
      ),
    );
  }

  static const List<Widget> widgetOptions = <Widget>[
    DashBoardPage(),
    EditProfile()
  ];
}
