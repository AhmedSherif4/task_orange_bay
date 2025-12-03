import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import '../../domain/entities/product.dart';

class ProductNameWidget extends StatelessWidget {
  final Product product;

  const ProductNameWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name,
      textAlign: TextAlign.right,
      style: AppStyles.font18BlackW400,
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .slideY(
          begin: 0.3,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOutBack,
        );
  }
}