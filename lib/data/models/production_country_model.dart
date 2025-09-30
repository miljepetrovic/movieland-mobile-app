import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/production_country.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountryModel {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;

  const ProductionCountryModel({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) => _$ProductionCountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);

  ProductionCountry toEntity() {
    return ProductionCountry(
      iso31661: iso31661,
      name: name,
    );
  }
}