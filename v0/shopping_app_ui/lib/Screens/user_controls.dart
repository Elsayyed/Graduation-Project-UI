import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _listTitlesMaker(
              title: 'Address',
              subtitle: 'Login to see address',
              iconShape: IconlyLight.profile,
              onPressed: () {}),
          _listTitlesMaker(
              title: 'Orders', iconShape: IconlyLight.bag2, onPressed: () {}),
          _listTitlesMaker(
              title: 'Wishlist',
              iconShape: IconlyLight.heart,
              onPressed: () {}),
          _listTitlesMaker(
              title: 'Viewed', iconShape: IconlyLight.show, onPressed: () {}),
          _listTitlesMaker(
              title: 'Forget password',
              iconShape: IconlyLight.lock,
              onPressed: () {}),
          _listTitlesMaker(
              title: 'Logout', iconShape: IconlyLight.logout, onPressed: () {}),
          SwitchListTile(
            title: Text('Theme'),
            secondary: Icon(themeState.getTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onChanged: (bool value) {
              setState(() {
                themeState.setTheme = value;
              });
            },
            value: themeState.getTheme,
          ),
        ],
      ),
    ));
  }

  Widget _listTitlesMaker(
      {required String title,
      String? subtitle,
      required IconData iconShape,
      required Function onPressed}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle == null ? '' : subtitle),
      trailing: const Icon(IconlyLight.arrowRight),
      leading: Icon(iconShape),
      onTap: () {
        onPressed();
      },
    );
  }
}
