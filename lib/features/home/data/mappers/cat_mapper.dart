import 'package:apiapp/features/home/data/model/cat_model.dart';
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';

extension CatMapper on CatModel {
  CatEntity toEntity() {
    return CatEntity(
      name: name,
      min_life_expectancy: min_life_expectancy,
      max_life_expectancy: max_life_expectancy,
      family_friendly: 'Рейтинг семейной дружественности: $family_friendly',
      origin: 'Страна рождения: $origin',
      image_link: image_link,
      length: 'Длина: $length',
      min_max_life_expectancy: 'Продолжительность жизни: $min_life_expectancy лет - $max_life_expectancy лет',
    );
  }
}