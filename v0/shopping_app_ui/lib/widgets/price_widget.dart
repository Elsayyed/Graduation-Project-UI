import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.price,
      required this.salePrice,
      required this.priceCount,
      required this.onSale})
      : super(key: key);

  final double price;
  final double salePrice;
  final String priceCount;
  final bool onSale;

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$${(price * int.parse(priceCount)).toStringAsFixed(2)}',
            color: Colors.green,
            textSize: 20,
          ),
          const SizedBox(
            width: 6,
          ),
          Visibility(
            visible: onSale ? true : false,
            child: Text(
              '\$${(price * int.parse(priceCount)).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                color: color,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          )
        ],
      ),
    );
  }
}
