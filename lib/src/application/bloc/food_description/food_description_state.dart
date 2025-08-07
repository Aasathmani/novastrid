import 'package:novastrid/src/application/model/meal_model.dart';

class FoodDescriptionState {
  MealModel? meal;
  bool isFavorite;
  String? toastMessage;

  FoodDescriptionState({this.meal, this.isFavorite = false, this.toastMessage});

  FoodDescriptionState copyWith({
    MealModel? meal,
    bool? isFavorite,
    String? toastMessage,
  }) {
    return FoodDescriptionState(
      meal: meal ?? this.meal,
      isFavorite: isFavorite ?? this.isFavorite,
      toastMessage: toastMessage ?? this.toastMessage,
    );
  }
}
