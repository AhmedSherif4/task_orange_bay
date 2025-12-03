import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/core/constants/app_strings.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import 'package:task_orange_bay/features/product_details/presentation/widgets/similar_products_widget.dart';

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.buyNow),
            duration: Duration(seconds: 2),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryOrange,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius10),
        ),
        elevation: 2,
      ),
      child: Text(
        AppStrings.buyNow,
        style: AppStyles.font18WhiteW400.copyWith(fontWeight: FontWeight.bold),
      ),
    ).animateShimmer();
  }
}
