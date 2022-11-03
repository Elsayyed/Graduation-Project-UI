import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/Screens/bottom_bar.dart';
import 'package:shopping_app_ui/Screens/home_screen.dart';
import 'package:shopping_app_ui/provider/dark_theme_provider.dart';
import 'constants/theme_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeProvider = DarkThemeProvider();

    void getAppTheme() async {
      themeProvider.setTheme = await themeProvider.darkThemePref.getTheme();
    }

    @override
    void initState() {
      getAppTheme();
      super.initState();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getTheme, context),
            home: const BottomBarScreen());
        // home: const HomeScreen());
      }),
    );
  }
}
