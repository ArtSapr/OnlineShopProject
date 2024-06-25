import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final num id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}

class RatingEntity {
  final num rate;
  final num count;

  RatingEntity({required this.rate, required this.count});
}
