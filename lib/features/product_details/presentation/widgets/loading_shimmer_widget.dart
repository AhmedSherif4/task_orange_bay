import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar Placeholder
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: 30.h),

            // Image Placeholder
            Container(
              height: 300.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimens.radius10),
              ),
            ),
            SizedBox(height: 19.h),

            // Fav/Share Placeholder
            Center(
              child: Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  // Name Placeholder
                  Container(height: 24.h, width: 200.w, color: Colors.white),
                  SizedBox(height: 8.h),

                  // Price Placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.h,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppDimens.radius10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),

                  // Rating Placeholder
                  Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(height: 20.h, width: 80.w, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Description Placeholder
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Container(
                          height: 14.h,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),

            // Similar Products Placeholder
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppDimens.radius10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
