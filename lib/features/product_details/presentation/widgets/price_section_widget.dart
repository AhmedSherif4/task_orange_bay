import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import 'package:task_orange_bay/features/product_details/presentation/widgets/similar_products_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/product.dart';

class PriceSectionWidget extends StatelessWidget {
  final Product product;
  const PriceSectionWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                ' ${product.price} ${AppStrings.currency}',
                textAlign: TextAlign.center,
                style: AppStyles.font15RedLineThrough.copyWith(
                  decoration: TextDecoration.none,
                ),
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideY(
              begin: 0.3,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOutBack,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child:
                  Text(
                        ' ${product.discountPrice ?? product.price} ${AppStrings.currency}',
                        textAlign: TextAlign.center,
                        style: AppStyles.font20BlackW400,
                      )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 600.ms,
                        curve: Curves.easeOutBack,
                      ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: ShapeDecoration(
                color: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radius10),
                ),
              ),
              child: Text(
                AppStrings.discount,
                textAlign: TextAlign.center,
                style: AppStyles.font18WhiteW400,
              ),
            ).animateShimmer(),
          ],
        ),
      ],
    );
  }
}
