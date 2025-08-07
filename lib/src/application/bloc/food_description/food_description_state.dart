import 'package:novastrid/src/application/model/meal_model.dart';

class FoodDescriptionState {
  MealModel? meal;

  FoodDescriptionState({ this.meal});

  FoodDescriptionState copyWith({MealModel? meal}) {
    return FoodDescriptionState(meal: meal ?? this.meal);
  }
}
