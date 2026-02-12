import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/shared/components/app_card.dart';
import 'package:flutter/material.dart';

class StartsCards extends StatelessWidget {
  final String title;
  final int count;
  final Color? cardColor;
  final Color? borderColor;
  final Color? textColor;
  const StartsCards({super.key, required this.title, required this.count, this.cardColor, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: borderColor,
      color: cardColor,
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(color: textColor, fontWeight: FontWeight.w600),
          ),
          Text("$count", style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
