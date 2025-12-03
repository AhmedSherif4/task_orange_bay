import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
import '../widgets/bottom_action_widget.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/loading_shimmer_widget.dart';
import '../widgets/product_details_content_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // Listen to the ProductDetailsCubit state to render the appropriate UI
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              return switch (state.requestState) {
                RequestState.loading => const LoadingShimmerWidget(),
                RequestState.error => ErrorStateWidget(
                  message: state.errorMessage,
                ),
                RequestState.empty => const EmptyStateWidget(),
                RequestState.loaded =>
                  state.product != null
                      ? ProductDetailsContentWidget(
                          product: state.product!,
                          similarProducts: state.similarProducts,
                        )
                      : const SizedBox.shrink(),
                RequestState.init => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
      // Show the bottom action bar only when the product is loaded
      bottomNavigationBar:
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            buildWhen: (previous, current) =>
                previous.requestState != current.requestState ||
                previous.product != current.product,
            builder: (context, state) {
              if (state.requestState == RequestState.loaded &&
                  state.product != null) {
                return const BottomActionWidget();
              }
              return const SizedBox.shrink();
            },
          ),
    );
  }
}
