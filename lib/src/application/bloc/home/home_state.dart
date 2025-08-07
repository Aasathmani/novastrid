import 'package:novastrid/src/application/model/meal_model.dart';
import 'package:novastrid/src/core/app_constants.dart';

import '../../model/mock_data_model.dart';

class HomeState {
  MockDataModel? mockData;
  List<MealModel>? favMeals;
  String selectDrawerItem;
  int selectedIndex;
  HomeState({
    this.mockData,
    this.selectDrawerItem = DrawerItem.meals,
    this.selectedIndex = 0,
    this.favMeals = const <MealModel>[],
  });
  HomeState copyWith({
    MockDataModel? mockData,
    String? selectDrawerItem,
    int? selectedIndex,
    List<MealModel>? favMeals,
  }) {
    return HomeState(
      mockData: mockData ?? this.mockData,
      selectDrawerItem: selectDrawerItem ?? this.selectDrawerItem,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      favMeals: favMeals ?? this.favMeals,
    );
  }
}
