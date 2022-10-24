import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/provider/dark_theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
          child: SwitchListTile(
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
      )),
    );
  }
}
