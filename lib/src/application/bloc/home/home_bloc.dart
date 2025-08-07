import 'package:bloc/bloc.dart';
import 'package:novastrid/src/application/model/meal_model.dart';
import 'package:novastrid/src/data/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeState()) {
    on<HomeInit>((event, emit) async {
      await _onInit(event, emit);
    });
    on<SelectDrawerItemEvent>((event, emit) {
      emit(state.copyWith(selectDrawerItem: event.item));
    });
    on<ChangeBottomBar>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
      add(HomeInit());
    });
    add(HomeInit());
  }

  Future<void> _onInit(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      final mockData = await homeRepository.getCategories();
      final prefs = await SharedPreferences.getInstance();

      final List<String> favoriteMealIds =
          prefs.getStringList('favoriteMeals') ?? [];

      final List<MealModel> favMeals = mockData.dummyMeals
          .where((meal) => favoriteMealIds.contains(meal.id))
          .toList();

      emit(state.copyWith(mockData: mockData, favMeals: favMeals));
    } catch (e) {
      print("Error in _onInit: $e");
    }
  }
}

class FoodListArgument {
  String? title;
  String? category;
  FoodListArgument({this.category, this.title});
}
