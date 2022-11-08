import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';
import '../provider/dark_theme_provider.dart';

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
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        print('Category pressed');
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
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
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
