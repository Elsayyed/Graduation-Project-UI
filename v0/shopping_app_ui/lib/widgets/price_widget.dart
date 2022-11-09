import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$1.59',
            color: Colors.green,
            textSize: 22,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            '\$1.59',
            style: TextStyle(
              fontSize: 16,
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}
