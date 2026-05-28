import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../domain/waste_category.dart';
import 'app_card.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final WasteCategory category;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: category.softColor,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(category.icon, color: category.color, size: 28),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  category.examples,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
