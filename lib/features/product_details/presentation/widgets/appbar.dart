import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_orange_bay/app_assets/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';

class ProductDetailsAppBar extends StatelessWidget {
  final String category;
  const ProductDetailsAppBar({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.15,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.radius30),
            bottomRight: Radius.circular(AppDimens.radius30),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 5,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.padding16,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.iconsArrowIosForwardFill,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textBlack,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  category,
                  textAlign: TextAlign.center,
                  style: AppStyles.font16BlackW400,
                ),
                SvgPicture.asset(
                  Assets.iconsCartDuoline,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textGrey,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 343.w,
            height: 50.h,
            decoration: ShapeDecoration(
              color: AppColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius25),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 3,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppStrings.product,
                  textAlign: TextAlign.center,
                  style: AppStyles.font15OrangeW400,
                ),
                VerticalDivider(color: AppColors.borderGrey, thickness: 1.w),
                Text(
                  AppStrings.rating,
                  textAlign: TextAlign.center,
                  style: AppStyles.font15BlackW400,
                ),
                VerticalDivider(color: AppColors.borderGrey, thickness: 1.w),
                Text(
                  AppStrings.help,
                  textAlign: TextAlign.center,
                  style: AppStyles.font15BlackW400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
