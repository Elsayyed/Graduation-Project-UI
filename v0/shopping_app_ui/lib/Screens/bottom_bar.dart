import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/Screens/cart.dart';
import 'package:shopping_app_ui/Screens/categories.dart';
import 'package:shopping_app_ui/Screens/home_screen.dart';
import 'package:shopping_app_ui/Screens/user_controls.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];

  void _selectedPageIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getTheme;
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      // appBar: AppBar(
      //   title: Center(child: Text(_pages[_selectedIndex]['title'])),
      // ),
      backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        // type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: _selectedPageIndex,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: "Cart",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
      ),
    );
  }
}
