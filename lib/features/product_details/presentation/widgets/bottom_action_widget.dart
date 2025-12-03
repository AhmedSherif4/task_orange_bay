import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/core/constants/app_strings.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
import 'quantity_counter_widget.dart';
import 'buy_button_widget.dart';

class BottomActionWidget extends StatelessWidget {
  const BottomActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.padding16,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const QuantityCounterWidget(),
            SizedBox(width: 16.w),
            const Expanded(child: BuyButtonWidget()),
          ],
        ),
      ),
    );
  }
}