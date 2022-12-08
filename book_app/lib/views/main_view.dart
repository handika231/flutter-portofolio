import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/main_notifier.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainNotifier>(context, listen: false);
    print('BUILD');
    return Scaffold(
      body: provider.views[provider.currentIndex],
      bottomNavigationBar: Consumer<MainNotifier>(
        builder: (context, value, child) => NavigationBar(
          destinations: value.destination,
          selectedIndex: value.currentIndex,
          onDestinationSelected: value.changeIndex,
        ),
      ),
    );
  }
}
