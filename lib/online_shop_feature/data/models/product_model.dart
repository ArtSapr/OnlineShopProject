import 'package:online_shop_project/online_shop_feature/data/models/rating_model.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required id,
    required title,
    required price,
    required description,
    required category,
    required image,
    required rating,
  }) : super(
    id: id,
    title: title,
    price: price,
    description: description,
    category: category,
    image: image,
    rating: rating,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rate': rating,
    };
  }
}
