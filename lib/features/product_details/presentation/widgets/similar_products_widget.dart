import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:task_orange_bay/app_assets/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';
import '../../domain/entities/product.dart';

class SimilarProductsWidget extends StatelessWidget {
  final List<Product> similarProducts;
  const SimilarProductsWidget({super.key, required this.similarProducts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: similarProducts.length,
      itemBuilder: (context, index) {
        return SimilarProductWidget(product: similarProducts[index]);
      },
    );
  }
}

class SimilarProductWidget extends StatelessWidget {
  const SimilarProductWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius10)),
            color: AppColors.white,
            border: Border.all(width: 1.w, color: AppColors.borderGrey),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 2.50,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.imageBackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.radius10),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryOrange,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Lottie.asset(
                        Assets.lottieNoData,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    product.name,
                    textAlign: TextAlign.right,
                    style: AppStyles.font14BlackW400,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${product.price} ${AppStrings.currency}',
                    textAlign: TextAlign.center,
                    style: AppStyles.font15RedLineThrough.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${product.price} ${AppStrings.currency}',
                      textAlign: TextAlign.right,
                      style: AppStyles.font17BlackW400.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 4.h),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.iconsHeart,
                      height: AppDimens.iconSize24,
                      width: AppDimens.iconSize24,
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(AppStrings.buyNow)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: ShapeDecoration(
                            color: AppColors.primaryOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimens.radius5,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.buyNow,
                            style: AppStyles.font14WhiteW500.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ).animateShimmer(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

extension WidgetAnimationExtension on Widget {
  Widget animateShimmer({
    List<Color>? colors,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return animate(
      onPlay: (controller) => controller.repeat(reverse: true),
    ).shimmer(delay: 500.ms, duration: duration, colors: colors);
  }
}
