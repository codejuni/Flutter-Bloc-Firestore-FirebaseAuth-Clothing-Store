import 'package:clothing_store_firestore_crud/src/domain/models/bag_model.dart';
import 'package:clothing_store_firestore_crud/src/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BagTile extends StatelessWidget {
  const BagTile({
    super.key,
    required this.bag,
  });

  final BagModel bag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Card(
            child: Image.network(
              bag.product.colors[bag.color].images[0],
              width: 120,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bag.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.hexToColor(
                      bag.product.colors[bag.color].color,
                    ),
                  ),
                  Text(
                    '\$${bag.product.price.toStringAsFixed(2)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
