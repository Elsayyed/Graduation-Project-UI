import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/favourite_widget.dart';
import 'package:shopping_app_ui/widgets/price_widget.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

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

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(children: [
          Image.network(
            'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
            width: _screenSize.width * 0.15,
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: 'Title', color: color, textSize: 20),
                favouriteButton()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: PriceWidget(
                    price: 5.0,
                    onSale: false,
                    salePrice: 2.0,
                    priceCount: _quantityController.text,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextWidget(text: 'LB', color: color, textSize: 16),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(contentPadding: EdgeInsets.all(5)),
                    controller: _quantityController,
                    maxLines: 1,
                    enabled: true,
                    onChanged: (priceValue) {
                      setState(() {});
                    },
                    key: const ValueKey('10'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).cardColor),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: Icon(
                Icons.add_business_rounded,
                size: 25,
                color: theme
                    ? Colors.white
                    : Theme.of(context).colorScheme.background,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
