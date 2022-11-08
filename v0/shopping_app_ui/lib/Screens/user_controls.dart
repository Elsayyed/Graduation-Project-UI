import 'package:flutter/cupertino.dart';
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
  var _name = 'Lorem Ipsum';
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(7.0, 7.0, 14.0, 7.0),
                  child: CircleAvatar(
                    backgroundImage: Image.asset('assets/images/cat.jpg').image,
                    radius: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, $_name!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 2,
                      ),
                    ),
                    Divider(
                      height: 6,
                    ),
                    Text(
                      'LoremIpsum@hotmail.com',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: themeState.getTheme ? Colors.white60 : Colors.black54,
            ),
            SizedBox(
              height: 20,
            ),
            _listTitlesMaker(
                title: 'Address',
                subtitle: 'Login to see address',
                iconShape: IconlyLight.profile,
                onPressed: () {}),
            // _listTitlesMaker(
            //     title: 'Orders', iconShape: IconlyLight.bag2, onPressed: () {}),
            // _listTitlesMaker(
            //     title: 'Wishlist',
            //     iconShape: IconlyLight.heart,
            //     onPressed: () {}),
            _listTitlesMaker(
                title: 'Viewed', iconShape: IconlyLight.show, onPressed: () {}),
            _listTitlesMaker(
                title: 'Forget password',
                iconShape: IconlyLight.lock,
                onPressed: () {}),
            _listTitlesMaker(
                title: 'Logout',
                iconShape: IconlyLight.logout,
                onPressed: showLogoutDialog),
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
      ),
    ));
  }

  Future<void> showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Log out'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Text('No',
                    style: TextStyle(
                      color: Colors.green,
                    )),
              ),
              const TextButton(
                onPressed: null,
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            elevation: 48,
          );
        });
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
