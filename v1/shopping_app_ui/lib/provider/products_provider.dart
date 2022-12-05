import 'package:flutter/material.dart';

import '../models/productModel.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return products;
  }

  List<ProductModel> get getOnSaleProducts {
    return products.where((product) => product.isOnSale).toList();
  }

  ProductModel findProdById(String productId) {
    return products.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> filterByCategory(String category) {
    return products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(category.toLowerCase()))
        .toList();
  }

  static final List<ProductModel> products = [
    ProductModel(
        'Tomatoes',
        'Tomatoes',
        'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
        "Vegetables",
        5.00,
        2,
        true,
        false),
    ProductModel(
        'Pomegranate',
        'Pomegranate',
        'https://purepng.com/public/uploads/large/purepng.com-pomegranatepomegranatepunica-granatumfruit-bearingshrub-1701527359553pgiat.png',
        "Fruits",
        6.00,
        3,
        true,
        true),
    ProductModel(
        'Tomatoes',
        'Tomatoes',
        'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
        "Vegetables",
        5.00,
        2,
        false,
        false),
    ProductModel(
        'Pomegranate',
        'Pomegranate',
        'https://purepng.com/public/uploads/large/purepng.com-pomegranatepomegranatepunica-granatumfruit-bearingshrub-1701527359553pgiat.png',
        "Fruits",
        6.00,
        3,
        false,
        true),
    ProductModel(
        'Tomatoes',
        'Tomatoes',
        'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
        "Vegetables",
        5.00,
        2,
        true,
        false),
    ProductModel(
        'Tomatoes',
        'Tomatoes',
        'https://freepngimg.com/thumb/tomato/6-tomato-png-image.png',
        "Vegetables",
        5.00,
        2,
        false,
        false),
    ProductModel(
        'Pomegranate',
        'Pomegranate',
        'https://purepng.com/public/uploads/large/purepng.com-pomegranatepomegranatepunica-granatumfruit-bearingshrub-1701527359553pgiat.png',
        "Fruits",
        6.00,
        3,
        true,
        true),
    ProductModel(
        'Pomegranate',
        'Pomegranate',
        'https://purepng.com/public/uploads/large/purepng.com-pomegranatepomegranatepunica-granatumfruit-bearingshrub-1701527359553pgiat.png',
        "Fruits",
        6.00,
        3,
        true,
        true),
  ];
}
