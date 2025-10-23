import 'package:flutter/material.dart';

class ProductSpecialInfoSymbol extends StatelessWidget {
  final bool isJFood;
  final bool isVegetFood;
  final bool isVeganFood;
  final bool glutenFree;
  final double hozSpace;
  final double verSpace;
  const ProductSpecialInfoSymbol({
    super.key,
    this.isJFood = true,
    this.isVegetFood = true,
    this.isVeganFood = true,
    this.glutenFree = true,
    this.hozSpace = 3.0,
    this.verSpace = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: hozSpace,
      runSpacing: verSpace,
      children: [
        if (isJFood) Icon(Icons.check_circle, color: Colors.yellow.shade700),
        if (isVegetFood) Icon(Icons.check_circle, color: Colors.lime.shade700),
        if (isVeganFood) Icon(Icons.check_circle, color: Colors.green.shade700),
        if (glutenFree) Icon(Icons.block_flipped, color: Colors.brown.shade700),
      ],
    );
  }
}
