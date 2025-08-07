import 'package:novastrid/src/application/model/meal_model.dart';

class FoodListState {
  List<MealModel>? meals;
  FoodListState({this.meals = const <MealModel>[]});

  FoodListState copyWith({List<MealModel>? meals}) {
    return FoodListState(meals: meals ?? this.meals);
  }
}
