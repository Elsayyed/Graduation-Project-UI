import 'package:flutter/material.dart';
import 'package:shopping_app_ui/models/cartModel.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addProductToCart({required String productId, required int quantity}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
              DateTime.now().toString(),
              productId,
              quantity,
            ));
    notifyListeners();
  }

  void decreaseQuantityByOne(String productId){
    _cartItems.update(productId, (value) =>
        CartModel(
          value.id,
          productId,
          value.quantity -1,
        ),
    );
    notifyListeners();
  }

  void increaseQuantityByOne(String productId){
    _cartItems.update(productId, (value) =>
        CartModel(
          value.id,
          productId,
          value.quantity + 1,
        ),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearShoppingCart() {
    _cartItems.clear();
    notifyListeners();
  }

}
