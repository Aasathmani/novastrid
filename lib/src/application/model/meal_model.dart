class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final String affordability;
  final String complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      categories: List<String>.from(json['categories']),
      title: json['title'],
      affordability: json['affordability'],
      complexity: json['complexity'],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      isGlutenFree: json['isGlutenFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
      isLactoseFree: json['isLactoseFree'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'affordability': affordability,
      'complexity': complexity,
      'imageUrl': imageUrl,
      'duration': duration,
      'ingredients': ingredients,
      'steps': steps,
      'isGlutenFree': isGlutenFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isLactoseFree': isLactoseFree,
    };
  }
}
