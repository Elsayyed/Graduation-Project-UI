import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class favouriteButton extends StatefulWidget {
  const favouriteButton({Key? key}) : super(key: key);

  @override
  State<favouriteButton> createState() => _favouriteButtonState();
}

class _favouriteButtonState extends State<favouriteButton> {
  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    // Size _screenSize = Utils(context).screenSize;
    Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
