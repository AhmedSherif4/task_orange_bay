import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final Category category;
  final String name;
  final String price;
  final String? discountPrice;
  final String brand;
  final String description;
  final String image;
  final String material;
  final String length;
  final List<Review> reviews;
  final double averageRating;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    this.discountPrice,
    required this.brand,
    required this.description,
    required this.image,
    required this.material,
    required this.length,
    required this.reviews,
    required this.averageRating,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [
    id,
    category,
    name,
    price,
    discountPrice,
    brand,
    description,
    image,
    material,
    length,
    reviews,
    averageRating,
    isFavorite,
  ];
}

class Category extends Equatable {
  final int id;
  final String name;
  final String slug;

  const Category({required this.id, required this.name, required this.slug});

  @override
  List<Object?> get props => [id, name, slug];
}

class Review extends Equatable {
  final int id;
  final String user;
  final int rating;
  final String comment;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, user, rating, comment, createdAt];
}
