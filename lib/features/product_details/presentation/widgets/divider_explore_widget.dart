import 'package:flutter/material.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import 'package:task_orange_bay/core/constants/app_strings.dart';

class DividerExploreWidget extends StatelessWidget {
  const DividerExploreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: AppColors.dividerGrey,
            thickness: 1,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(AppDimens.radius10),
            ),
            child: Center(
              child: Text(
                AppStrings.similarItems,
                textAlign: TextAlign.center,
                style: AppStyles.font19BlackW400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}