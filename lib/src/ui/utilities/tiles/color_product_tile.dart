import 'package:clothing_store_firestore_crud/src/domain/models/products/product_color_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ColorProductTile extends StatelessWidget {
  const ColorProductTile({
    super.key,
    required this.color,
    required this.selected,
  });

  final ProductColorModel color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 30,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(2),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: selected ? Colors.black : Colors.transparent,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.hexToColor(color.color),
        ),
      ),
    );
  }
}
