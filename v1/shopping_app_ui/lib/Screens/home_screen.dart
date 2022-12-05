import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/models/productModel.dart';
import 'package:shopping_app_ui/provider/dark_theme_provider.dart';
import 'package:shopping_app_ui/provider/products_provider.dart';
import 'package:shopping_app_ui/widgets/price_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../innerScreens/allproducts_page.dart';
import '../services/utilMethods.dart';
import '../services/utils.dart';
import '../widgets/feed_widget.dart';
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
    final productProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> allproducts = productProvider.getProducts;
    List<ProductModel> productsOnSale = productProvider.getOnSaleProducts;
    // final productModel = Provider.of<ProductModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              child: Image.network(
                  'https://images.unsplash.com/photo-1601598851547-4302969d0614?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      const Icon(
                        IconlyLight.dangerCircle,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(
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
                      itemCount: productsOnSale.length < 10
                          ? productsOnSale.length
                          : 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: productsOnSale[index],
                            child: const SaleWidget());
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(
                    text: 'All Products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      UtilMethods.navigateTo(
                          context: context,
                          routeName: productsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      color: Colors.lightBlue,
                      textSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: screenSize.width / (screenSize.height * 0.6),
                children: List.generate(
                    allproducts.length < 4 ? allproducts.length : 4, (index) {
                  return ChangeNotifierProvider.value(
                    value: allproducts[index],
                    child: const FeedWidget(),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
