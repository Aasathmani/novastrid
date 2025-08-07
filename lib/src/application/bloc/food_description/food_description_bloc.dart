import 'package:bloc/bloc.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_event.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_state.dart';
import 'package:novastrid/src/data/home/home_repository.dart';

class FoodDescriptionBloc
    extends Bloc<FoodDescriptionEvent, FoodDescriptionState> {
  final String mealId;
  final HomeRepository homeRepository;

  FoodDescriptionBloc({required this.mealId, required this.homeRepository})
    : super(FoodDescriptionState()) {
    on<FoodDescriptionInit>((event, emit) async {
      await _onFoodDescriptionInit(event, emit);
    });
    add(FoodDescriptionInit());
  }

  Future<void> _onFoodDescriptionInit(FoodDescriptionInit event, Emitter<FoodDescriptionState> emit)async {
    try{
      final mockData = await homeRepository.getCategories();
      final meal = mockData.dummyMeals.firstWhere((meal) => meal.id == mealId);
      emit(state.copyWith(meal: meal));

    }
    catch(e){
      print("Error in _onFoodDescriptionInit: $e");
    }
  }
}
