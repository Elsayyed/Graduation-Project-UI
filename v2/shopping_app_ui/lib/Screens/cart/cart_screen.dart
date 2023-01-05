import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/services/utilMethods.dart';
import 'package:shopping_app_ui/widgets/text_widget.dart';
import '../../innerScreens/path_page.dart';
import '../../provider/cart_provider.dart';
import '../../services/utils.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    int cartVal = 3;
    double totalPrice = 0.29 * 6;
    final cartProvider = Provider.of<CartProvider>(context);
    final carItemList = cartProvider.getCartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: TextWidget(
          text: 'Cart (${carItemList.length})',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {
              UtilMethods.warningDialogPopUp(
                  title: 'Empty the cart?',
                  subText: 'Are you sure?',
                  functionHandle: () {
                    cartProvider.clearShoppingCart();
                  },
                  context: context);
            },
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
                NavigateButton(color: color, context: context),
                const Spacer(),
                TextWidget(
                  text: 'Total \$${totalPrice.toStringAsFixed(2)}',
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
                itemCount: carItemList.length,
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                      value: carItemList[index], child: CartWidget(
                      quantity: carItemList[index].quantity,
                  ));
                }),
          ),
        ],
      ),
    );
  }

  Widget NavigateButton({required Color color, required BuildContext context}) {

    final data = <String, List<int>>{
      //optimization concat the coordinates as a string id, if given again
      //use memoization for the calculated paths!
      "coordinates": [1,2,4,3,10,20,29,25],
    };

    return Material(
      elevation: 2,
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),

          onTap: () async {
            UtilMethods.navigateTo(
                context: context,
                routeName: pathDisplay.routeName);

            CollectionReference shoppingListCoordCollection =
            FirebaseFirestore.instance.collection('shopping-list-coord');

            await shoppingListCoordCollection.doc('JHVDFhzmHxvhLmoHy8Mw').set(data)
                .onError((FirebaseException e, _) => print("Error writing document: $e"))
                .onError((e, _) => print("Error writing document: $e"));

            print('I\'ve arrived');
          },
          child: TextWidget(
              text: 'Finalize & Navigate', color: color, textSize: 16),
        ),
      ),
    );
  }
}
