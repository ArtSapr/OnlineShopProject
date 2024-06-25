import '../../domain/entities/product_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    required rate,
    required count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'] as num,
      count: json['count'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
