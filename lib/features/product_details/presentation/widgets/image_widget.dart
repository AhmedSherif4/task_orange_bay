import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_orange_bay/app_assets/app_assets.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:task_orange_bay/features/product_details/presentation/cubit/product_details_state.dart';
import 'package:task_orange_bay/features/product_details/presentation/widgets/fav_share_widget.dart';

import '../../../../core/constants/app_colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final carouselController = CarouselSliderController();

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.currentImageIndex != current.currentImageIndex,
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 300.h,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  context.read<ProductDetailsCubit>().setCurrentImageIndex(
                    index,
                  );
                },
              ),
              items: images.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    color: AppColors.imageBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.radius10),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Lottie.asset(
                          Assets.lottieNoData,
                          width: MediaQuery.of(context).size.width,
                          height: 300.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 19.h),
            const FavShareWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.currentImageIndex == entry.key
                          ? AppColors.primaryOrange
                          : AppColors.primaryOrange.withValues(alpha: 0.3),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
