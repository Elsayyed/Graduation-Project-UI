import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/Screens/bottom_bar.dart';
import 'package:shopping_app_ui/Screens/home_screen.dart';
import 'package:shopping_app_ui/innerScreens/category_page.dart';
import 'package:shopping_app_ui/provider/cart_provider.dart';
import 'package:shopping_app_ui/provider/dark_theme_provider.dart';
import 'package:shopping_app_ui/provider/products_provider.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';
import 'Screens/fetchDataScreen.dart';
import 'constants/theme_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'innerScreens/allproducts_page.dart';
import 'innerScreens/path_page.dart';
import 'innerScreens/product_details.dart';

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

  final Future<FirebaseApp> _initFirebase = Firebase.initializeApp();

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

    return FutureBuilder(
      future: _initFirebase,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const MaterialApp(home:
          Scaffold(body: Center(child: CircularProgressIndicator(),),),);
        }
        else if (snapshot.hasError){
          MaterialApp(home: Scaffold(body: Center(child: TextWidget(text: 'An error has occurred', textSize: 18, color: Colors.red, isTitle: true,),),),);
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) {
              return themeProvider;
            }),
            ChangeNotifierProvider(create: (_) {
              return ProductsProvider();
            }),
            ChangeNotifierProvider(create: (_) {
              return CartProvider();
            }),
          ],
          child:
              Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Shopping Assistant Cart',
                theme: Styles.themeData(themeProvider.getTheme, context),
                routes: {
                  productsScreen.routeName: (context) => const productsScreen(),
                  productDetails.routeName: (context) => const productDetails(),
                  categoryScreen.routeName: (context) => const categoryScreen(),
                  pathDisplay.routeName: (context) => const pathDisplay(),
                },
                home: const FetchScreen());
            // home: const HomeScreen());
          }),
        );
      }
    );
  }
}
