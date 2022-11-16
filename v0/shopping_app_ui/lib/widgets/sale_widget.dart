import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopping_app_ui/services/utils.dart';
import 'package:shopping_app_ui/widgets/favourite_widget.dart';
import 'package:shopping_app_ui/widgets/price_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../innerScreens/product_details.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            UtilMethods.navigateTo(
                context: context, routeName: productDetails.routeName);
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
                      'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
                      width: _screenSize.width * 0.15,
                    ),
                    Column(children: [
                      const SizedBox(
                        height: 6,
                      ),
                      TextWidget(
                        text: '1Kg',
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
                const PriceWidget(
                  onSale: true,
                  price: 5.00,
                  salePrice: 2.99,
                  priceCount: '1',
                ),
                SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'Tomatoes',
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                SizedBox(
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
