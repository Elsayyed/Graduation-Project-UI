import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/innerScreens/allproducts_page.dart';
import 'package:shopping_app_ui/services/utils.dart';
import 'package:shopping_app_ui/widgets/favourite_widget.dart';
import 'package:shopping_app_ui/widgets/price_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../innerScreens/product_details.dart';
import '../models/productModel.dart';
import '../provider/products_provider.dart';
import '../services/utilMethods.dart';

class SaleWidget extends StatefulWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  State<SaleWidget> createState() => _SaleWidgetState();
}

class _SaleWidgetState extends State<SaleWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    final productModel = Provider.of<ProductModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(
              context,
              productDetails.routeName,
              arguments: productModel.id,
            );
            // UtilMethods.navigateTo(
            //     context: context, routeName: productDetails.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      productModel.imageLink,
                      width: _screenSize.width * 0.15,
                    ),
                    Column(children: [
                      const SizedBox(
                        height: 6,
                      ),
                      TextWidget(
                        text: productModel.isPerPiece ? '1Pc' : '1Kg',
                        color: color,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag,
                              size: 22,
                              color: color,
                            ),
                          ),
                          favouriteButton(),
                        ],
                      ),
                    ])
                  ],
                ),
                PriceWidget(
                  onSale: true,
                  price: productModel.price,
                  salePrice: productModel.salePrice,
                  priceCount: '1',
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: productModel.title,
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
