import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String id, productId;
  final int quantity;

  CartModel(this.id, this.productId, this.quantity);
}
