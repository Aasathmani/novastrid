import 'package:bloc/bloc.dart';
import 'package:novastrid/src/data/home/home_repository.dart';

import 'food_list_event.dart';
import 'food_list_state.dart';

class FoodListBloc extends Bloc<FoodListEvent, FoodListState>{
  final HomeRepository homeRepository;
  String? category;
  String? title;
  FoodListBloc({
    required this.homeRepository,
    required this.title,
    required this.category,
}) : super(FoodListState()){
    on<FoodListInit>((event,emit)async{
      await _onFoodListInit(event,emit);
    });
    add(FoodListInit());
  }

  Future<void> _onFoodListInit(FoodListInit event, Emitter<FoodListState> emit) async {
    try {
      final mockData = await homeRepository.getCategories(); // includes meals and categories
      final categoryId = category; // assuming you get it from the event
      final meals = mockData.dummyMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      emit(state.copyWith(meals: meals)); // emit the filtered meals only
    } catch (e) {
      // handle error, maybe log or emit a failure state
      print("Error in _onFoodListInit: $e");
    }
  }

}