import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';

class RatingReviewWidget extends StatelessWidget {
  final double averageRating;
  final int reviewCount;
  const RatingReviewWidget({
    super.key,
    required this.averageRating,
    this.reviewCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EasyStarsDisplay(
          initialRating: averageRating,
          readOnly: true,
          filledColor: const Color(0xFFFFBB00),
          spacing: 2,
          starSize: 18.r,
        ),
        SizedBox(width: 5.w),
        Text(
          '$averageRating: تقييمات',
          style: AppStyles.font10BlackW400.copyWith(
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            height: 1.5,
          ),
        ),

        const Spacer(),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            '6974321040059'
            ' : '
            'SKU',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 2.27,
            ),
          ),
        ),
      ],
    );
  }
}
