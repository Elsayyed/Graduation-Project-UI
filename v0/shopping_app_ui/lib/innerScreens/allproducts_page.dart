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
  final _searchBoxController = TextEditingController(text: '1');

  @override
  void initState() {
    _searchBoxController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _searchBoxController.dispose();
    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  controller: _searchBoxController,
                  onChanged: (val) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'What are you looking for? ',
                    prefixIcon: const Icon(IconlyLight.search),
                  ),
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                    _screenSize.width / (_screenSize.height * 0.60),
                children: List.generate(8, (index) {
                  return const FeedWidget();
                }),
              ),
            ],
          ),
        ));
  }
}
