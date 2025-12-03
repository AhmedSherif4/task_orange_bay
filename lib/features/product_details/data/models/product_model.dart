import 'package:hive/hive.dart';

import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends Product {
  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final CategoryModel category;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final String price;
  @override
  @HiveField(4)
  final String? discountPrice;
  @override
  @HiveField(5)
  final String brand;
  @override
  @HiveField(6)
  final String description;
  @override
  @HiveField(7)
  final String image;
  @override
  @HiveField(8)
  final String material;
  @override
  @HiveField(9)
  final String length;
  @override
  @HiveField(10)
  final List<ReviewModel> reviews;
  @override
  @HiveField(11)
  final double averageRating;
  @override
  @HiveField(12)
  final bool isFavorite;

  const ProductModel({
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
  }) : super(
         id: id,
         category: category,
         name: name,
         price: price,
         discountPrice: discountPrice,
         brand: brand,
         description: description,
         image: image,
         material: material,
         length: length,
         reviews: reviews,
         averageRating: averageRating,
         isFavorite: isFavorite,
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      category: CategoryModel.fromJson(json['category']),
      name: json['name'],
      price: json['price'],
      discountPrice: json['discount_price'],
      brand: json['brand'],
      description: json['description'],
      image: json['image'] ?? '',
      material: json['material'],
      length: json['length'],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      averageRating: (json['average_rating'] as num).toDouble(),
      isFavorite: json['is_favorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.toJson(),
      'name': name,
      'price': price,
      'discount_price': discountPrice,
      'brand': brand,
      'description': description,
      'image': image,
      'material': material,
      'length': length,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'average_rating': averageRating,
      'is_favorite': isFavorite,
    };
  }
}

@HiveType(typeId: 1)
class CategoryModel extends Category {
  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String slug;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  }) : super(id: id, name: name, slug: slug);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}

@HiveType(typeId: 2)
class ReviewModel extends Review {
  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String user;
  @override
  @HiveField(2)
  final int rating;
  @override
  @HiveField(3)
  final String comment;
  @override
  @HiveField(4)
  final DateTime createdAt;

  const ReviewModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
    required this.createdAt,
  }) : super(
         id: id,
         user: user,
         rating: rating,
         comment: comment,
         createdAt: createdAt,
       );

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      user: json['user'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
