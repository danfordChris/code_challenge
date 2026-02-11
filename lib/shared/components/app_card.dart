import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child, this.margin, this.padding, this.borderRadius, this.color, this.borderColor, this.onTap});

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext sheetContext) {
    return Card.outlined(
      margin: margin ?? EdgeInsets.zero,
      color: color ?? sheetContext.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        side: BorderSide(color: borderColor ?? sheetContext.colorScheme.surfaceContainerHigh, width: 1.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: Row(children: [Expanded(child: child)]),
        ),
      ),
    );
  }
}
