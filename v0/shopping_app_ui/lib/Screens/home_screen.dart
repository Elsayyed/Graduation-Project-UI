import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/provider/dark_theme_provider.dart';
import 'package:shopping_app_ui/widgets/price_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';
import '../widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.33,
            width: screenSize.width,
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    Icon(
                      IconlyLight.dangerCircle,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    TextWidget(
                      text: 'Special'.toUpperCase(),
                      color: Colors.deepOrange,
                      textSize: 22,
                      isTitle: true,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: screenSize.height * 0.20,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const SaleWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
