import 'package:bloc/bloc.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_event.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_state.dart';
import 'package:novastrid/src/data/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodDescriptionBloc
    extends Bloc<FoodDescriptionEvent, FoodDescriptionState> {
  final String mealId;
  final HomeRepository homeRepository;

  FoodDescriptionBloc({required this.mealId, required this.homeRepository})
    : super(FoodDescriptionState()) {
    on<FoodDescriptionInit>((event, emit) async {
      await _onFoodDescriptionInit(event, emit);
    });
    on<FavoriteMealEvent>((event, emit) async {
      await _onFavoriteMealEvent(event, emit);
    });
    add(FoodDescriptionInit());
  }

  Future<void> _onFoodDescriptionInit(FoodDescriptionInit event, Emitter<FoodDescriptionState> emit) async {
    try {
      final mockData = await homeRepository.getCategories();
      final meal = mockData.dummyMeals.firstWhere((meal) => meal.id == mealId);

      final prefs = await SharedPreferences.getInstance();
      final List<String> favoriteMeals = prefs.getStringList('favoriteMeals') ?? [];

      final bool isFavorite = favoriteMeals.contains(mealId);

      emit(state.copyWith(meal: meal, isFavorite: isFavorite));
    } catch (e) {
      print("Error in _onFoodDescriptionInit: $e");
    }
  }

  Future<void> _onFavoriteMealEvent(FavoriteMealEvent event, Emitter<FoodDescriptionState> emit) async {
    try {
      final mealId = event.mealId;

      final prefs = await SharedPreferences.getInstance();
      final List<String> favoriteMeals = prefs.getStringList('favoriteMeals') ?? [];

      bool isFavorite = false;

      if (favoriteMeals.contains(mealId)) {
        favoriteMeals.remove(mealId);
        isFavorite = false;
      } else {
        favoriteMeals.add(mealId);
        isFavorite = true;
      }

      await prefs.setStringList('favoriteMeals', favoriteMeals);

      emit(state.copyWith(isFavorite: isFavorite));
    } catch (e) {
      print('Error saving favorite meal: $e');
    }
  }
}
