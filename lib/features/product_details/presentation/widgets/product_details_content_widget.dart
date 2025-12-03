import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/features/product_details/presentation/widgets/appbar.dart';
import 'package:task_orange_bay/features/product_details/presentation/widgets/image_widget.dart';

import '../../domain/entities/product.dart';
import 'description_widget.dart';
import 'divider_explore_widget.dart';
import 'price_section_widget.dart';
import 'product_name_widget.dart';
import 'rating_review_widget.dart';
import 'similar_products_widget.dart';

class ProductDetailsContentWidget extends StatelessWidget {
  final Product product;
  final List<Product> similarProducts;

  const ProductDetailsContentWidget({
    super.key,
    required this.product,
    required this.similarProducts,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      product.image,
      'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg',
      product.image,
    ];

    final double averageRating = product.reviews.isNotEmpty
        ? product.reviews
                  .map((review) => review.rating)
                  .reduce((a, b) => a + b) /
              product.reviews.length
        : 0.0;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsAppBar(
            category: '${product.category.name} / ${product.brand}',
          ),
          SizedBox(height: 30.h),
          ImageWidget(images: images),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                ProductNameWidget(product: product),
                SizedBox(height: 8.h),
                PriceSectionWidget(product: product),
                SizedBox(height: 40.h),
                RatingReviewWidget(
                  averageRating: averageRating,
                  reviewCount: product.reviews.length,
                ),
                SizedBox(height: 16.h),
                DescriptionWidget(description: product.description),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          const DividerExploreWidget(),
          SizedBox(height: 16.h),
          SimilarProductsWidget(similarProducts: similarProducts),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
