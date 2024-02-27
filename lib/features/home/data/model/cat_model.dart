class CatModel {
  final String name;
  final double min_life_expectancy;
  final double max_life_expectancy;
  final int family_friendly;
  final String origin;
  final String image_link;
  final String length;

  CatModel({
    required this.name,
    required this.min_life_expectancy,
    required this.max_life_expectancy,
    required this.family_friendly,
    required this.origin,
    required this.image_link,
    required this.length,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      name: json['name'],
      min_life_expectancy: json['min_life_expectancy'],
      max_life_expectancy: json['max_life_expectancy'],
      family_friendly: json['family_friendly'],
      origin: json['origin'],
      image_link: json['image_link'],
      length: json['length']
    );
  }
}