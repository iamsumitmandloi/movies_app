import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/router/app_router.dart';

@RoutePage()
class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), SearchRoute(), BookmarksRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // Dismiss keyboard when switching tabs
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              tabsRouter.setActiveIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'My List',
              ),
            ],
          ),
        );
      },
    );
  }
}
