import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/categories_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  final List<Map<String, dynamic>> _categoriesInfo = [
    {
      'imgPath': 'assets/images/veggie.jpg',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/fruits.jpg',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/protein.jpg',
      'catText': 'Protein',
    },
    {
      'imgPath': 'assets/images/dairy.jpg',
      'catText': 'Dairy',
    },
    {
      'imgPath': 'assets/images/desserts.jpg',
      'catText': 'Desserts',
    },
    {
      'imgPath': 'assets/images/snacks.jpg',
      'catText': 'snacks',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (240 / 250),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(
              6,
              (index) {
                return CategoriesWidget(
                  catName: _categoriesInfo[index]['catText'],
                  imgPath: _categoriesInfo[index]['imgPath'],
                  color: gridColors[index],
                );
              },
            ),
          ),
        ));
  }
}
