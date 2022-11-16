import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    int cartVal = 2;
    double totalPrice = 2.53;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: TextWidget(
          text: 'Cart (${cartVal})',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.delete,
              color: color,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.1,
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                NavigateButton(color: color),
                const Spacer(),
                TextWidget(
                  text: 'Total \$$totalPrice',
                  color: color,
                  textSize: 20,
                  isTitle: true,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return CartWidget();
                }),
          ),
        ],
      ),
    );
  }

  Widget NavigateButton({required Color color}) {
    return Material(
      elevation: 2,
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: TextWidget(
              text: 'Finalize & Navigate', color: color, textSize: 16),
        ),
      ),
    );
  }
}
