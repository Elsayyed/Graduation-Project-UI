import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/Screens/bottom_bar.dart';

import '../provider/products_provider.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 5), () async {
      final productsProvider = Provider.of<ProductsProvider>(context, listen: false);
      await productsProvider.fetchProducts();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
      (context) => const BottomBarScreen()));
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
