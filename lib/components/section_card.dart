import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    this.child,
    this.backgroundImageURL,
    this.padding = const EdgeInsets.only(bottom: 8.0),
    this.margin = EdgeInsets.zero,
    this.borderRadius = 12.0, // 5
    this.height,
    this.width,
    this.color = Colors.white,
  });

  final Widget? child;
  final String? backgroundImageURL;
  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: (backgroundImageURL == null)
            ? null
            : DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(backgroundImageURL!),
              ),
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
