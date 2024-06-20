import '../../domain/entities/product_entity.dart';

class RatingModel extends RatingEntity {

  RatingModel({rate, count}) : super(rate: rate, count: count);

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

}
