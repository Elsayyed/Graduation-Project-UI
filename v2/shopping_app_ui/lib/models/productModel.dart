import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id, title, imageLink, productCategory;
  final double price, salePrice;
  final bool isOnSale, isPerPiece;
  // final double shelfHeight, aisleNumber, zone, binNumber;

  ProductModel(
    this.id,
    this.title,
    this.imageLink,
    this.productCategory,
    this.price,
    this.salePrice,
    this.isOnSale,
    this.isPerPiece,
    // this.binNumber,
    // this.shelfHeight,
    // this.aisleNumber,
    // this.zone,
  );
}
