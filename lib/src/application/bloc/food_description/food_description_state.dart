import 'package:novastrid/src/application/model/meal_model.dart';

class FoodDescriptionState {
  MealModel? meal;
  bool isFavorite;

  FoodDescriptionState({this.meal, this.isFavorite = false});

  FoodDescriptionState copyWith({MealModel? meal, bool? isFavorite}) {
    return FoodDescriptionState(
      meal: meal ?? this.meal,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
