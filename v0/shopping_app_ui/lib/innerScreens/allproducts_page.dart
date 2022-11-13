import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';
import '../widgets/feed_widget.dart';

class productsScreen extends StatefulWidget {
  static const routeName = "/productsScreenState";

  const productsScreen({Key? key}) : super(key: key);

  @override
  State<productsScreen> createState() => _productsScreenState();
}

class _productsScreenState extends State<productsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
            ),
          ),
          elevation: 2,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'All products',
            color: color,
            textSize: 20,
            isTitle: true,
          ),
        ),
        body: Column(
          children: [
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: _screenSize.width / (_screenSize.height * 0.62),
              children: List.generate(4, (index) {
                return const FeedWidget();
              }),
            ),
          ],
        ));
  }
}
