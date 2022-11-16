import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';
import '../widgets/favourite_widget.dart';
import '../widgets/price_widget.dart';
import '../widgets/text_widget.dart';

class productDetails extends StatefulWidget {
  static const routeName = "/productDetailsState";

  const productDetails({Key? key}) : super(key: key);

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  final _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: _screenSize.width,
                height: _screenSize.height * 0.35,
                child: Image.network(
                  'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
                  // height: _screenSize.height * 0.25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Title',
                  color: color,
                  textSize: 22,
                  isTitle: true,
                ),
                const favouriteButton(),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: _screenSize.width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and '
                    'typesetting industry. Lorem Ipsum has been the industry\'s '
                    'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'
                    ' It has survived not only five centuries, but also the leap into electronic typesetting.',
                    textAlign: TextAlign.left,
                    textScaleFactor: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(
                    price: 22,
                    salePrice: 15,
                    priceCount: _quantityController.text,
                    onSale: true),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              quantityWidget(
                functionHandle: () {},
                icon: IconlyLight.arrowDown,
                color: Colors.red,
              ),
              Flexible(
                flex: 1,
                child: TextField(
                  controller: _quantityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(border: UnderlineInputBorder()),
                ),
              ),
              quantityWidget(
                functionHandle: () {},
                icon: IconlyLight.arrowUp,
                color: Colors.green,
              ),
            ],
          ),

          // TextWidget(
          //   text: '\$${(price * int.parse(priceCount)).toStringAsFixed(2)}',
          //   color: Colors.green,
          //   textSize: 20,
          // ),
          // Row(
          //   children: [
          //     TextWidget(text: 'Title', color: color, textSize: 20),
          //     const favouriteButton()
          //   ],
          // )
        ],
      ),
    );
  }

  Widget quantityWidget(
      {required Function functionHandle,
      required IconData icon,
      required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              functionHandle();
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
