import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/server_locator/injection_container.dart';
import '../../features/product_details/presentation/cubit/product_details_cubit.dart';
import '../../features/product_details/presentation/pages/product_details_page.dart';

class AppRoutes {
  static const String productDetailsPage = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                sl<ProductDetailsCubit>()..loadProductDetails(),
            child: const ProductDetailsPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found!')),
      ),
    );
  }
}
