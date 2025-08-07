import 'package:novastrid/src/application/bloc/filter/filter_bloc.dart';
import 'package:novastrid/src/application/bloc/home/home_bloc.dart';
import 'package:novastrid/src/application/bloc/splash/splash_bloc.dart';

import '../../../core/repository_provider.dart';
import '../food_list/food_list_bloc.dart';

SplashBloc provideSplashBloc() {
  return SplashBloc();
}

HomeBloc provideHomeBloc() {
  return HomeBloc(homeRepository: provideHomeRepository());
}

FilterBloc provideFilterBloc() {
  return FilterBloc();
}

FoodListBloc provideFoodListBloc(FoodListArgument argument) {
  return FoodListBloc(
      category: argument.category,
      title: argument.title,
      homeRepository: provideHomeRepository(),);
}
