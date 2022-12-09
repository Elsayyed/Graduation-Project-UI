import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/innerScreens/category_page.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';
import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catName,
      required this.imgPath,
      required this.color})
      : super(key: key);

  final String catName, imgPath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    var utils = Utils(context);

    final Color color = themeState.getTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          categoryScreen.routeName,
          arguments: catName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: utils.screenHeight * 0.2,
              width: utils.screenHeight * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidget(
              text: catName,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
