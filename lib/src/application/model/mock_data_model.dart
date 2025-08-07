import 'category_model.dart';
import 'meal_model.dart';

class MockDataModel {
  final List<CategoryModel> availableCategories;
  final List<MealModel> dummyMeals;

  MockDataModel({
    required this.availableCategories,
    required this.dummyMeals,
  });

  factory MockDataModel.fromJson(Map<String, dynamic> json) {
    return MockDataModel(
      availableCategories: (json['availableCategories'] as List)
          .map((item) => CategoryModel.fromJson(item))
          .toList(),
      dummyMeals: (json['dummyMeals'] as List)
          .map((item) => MealModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availableCategories':
      availableCategories.map((cat) => cat.toJson()).toList(),
      'dummyMeals': dummyMeals.map((meal) => meal.toJson()).toList(),
    };
  }
}
