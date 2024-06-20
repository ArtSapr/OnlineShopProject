import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

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
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
  ];

}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
}
