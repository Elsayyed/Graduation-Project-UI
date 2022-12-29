import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/innerScreens/product_details.dart';
import 'package:shopping_app_ui/models/cartModel.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';
import '../../provider/cart_provider.dart';
import '../../provider/products_provider.dart';
import '../../services/utils.dart';
import '../../widgets/favourite_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key, required this.quantity}) : super(key: key);
  final int quantity;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    _quantityController.text = widget.quantity.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    final productProvider = Provider.of<ProductsProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final getCurrentProd = productProvider.findProdById(cartModel.productId);
    double usedPrice = getCurrentProd.isOnSale
        ? getCurrentProd.salePrice
        : getCurrentProd.price;
    double totalPrice = usedPrice * int.parse(_quantityController.text);

    @override
    void dispose() {
      _quantityController.dispose();
      super.dispose();
    }

    //TODO: LIMIT THE KEYBOARD TO ONLY INTEGER VALUES
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          productDetails.routeName,
          arguments: cartModel.productId,
        );
      },
      child: Row(
        children: [
          const SizedBox(
            width: 7,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12)),
            child: Container(
                width: _screenSize.width * 0.25,
                height: _screenSize.height * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Image.network(getCurrentProd.imageLink)),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: getCurrentProd.title,
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: _screenSize.width * 0.3,
                child: Row(
                  children: [
                    quantityWidget(
                      functionHandle: () {
                        setState(() {
                          if (_quantityController.text == '1') {
                            return;
                          } else {
                            cartProvider.decreaseQuantityByOne(getCurrentProd.id);
                            _quantityController.text =
                                (int.parse(_quantityController.text) - 1)
                                    .toString();
                          }
                        });
                      },
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder()),
                      ),
                    ),
                    quantityWidget(
                      functionHandle: () {
                        cartProvider.increaseQuantityByOne(getCurrentProd.id);
                        setState(() {
                          _quantityController.text =
                              (int.parse(_quantityController.text) + 1)
                                  .toString();
                        });
                      },
                      icon: IconlyLight.arrowUp,
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    cartProvider.removeItem(getCurrentProd.id);
                  },
                  child: const Icon(
                    Icons.remove_shopping_cart_outlined,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
               const SizedBox(
                  height: 4,
                ),
                const favouriteButton(),
                TextWidget(
                  text: '\$${usedPrice.toStringAsFixed(2)}',
                  color: color,
                  textSize: 18,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
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
