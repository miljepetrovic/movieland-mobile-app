import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/production_company.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompanyModel {
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  const ProductionCompanyModel({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) => _$ProductionCompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);

  ProductionCompany toEntity() {
    return ProductionCompany(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }
}