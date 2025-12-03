import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_dimens.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class QuantityCounterWidget extends StatelessWidget {
  const QuantityCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(AppDimens.radius10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<ProductDetailsCubit>().decrementQuantity();
            },
            icon: const Icon(Icons.remove),
            color: AppColors.textBlack,
          ),
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            buildWhen: (previous, current) =>
                previous.quantity != current.quantity,
            builder: (context, state) {
              return Text(
                '${state.quantity}',
                style: AppStyles.font18BlackW400,
              );
            },
          ),
          IconButton(
            onPressed: () {
              context.read<ProductDetailsCubit>().incrementQuantity();
            },
            icon: const Icon(Icons.add),
            color: AppColors.textBlack,
          ),
        ],
      ),
    );
  }
}