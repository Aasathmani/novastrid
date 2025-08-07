import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/src/presentation/filter/filter_page.dart';
import 'package:novastrid/src/presentation/home/home_page.dart';

import '../application/bloc/core/bloc_provider.dart';
import '../application/bloc/food_list/food_list_bloc.dart';
import '../application/bloc/home/home_bloc.dart';
import '../presentation/food_list/food_list_page.dart';
import '../presentation/splash/splash_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = {
  SplashPage.route: (_) => BlocProvider(
    create: (context) => provideSplashBloc(),
    child: SplashPage(),
  ),
  HomePage.route: (_) =>
      BlocProvider(create: (context) => provideHomeBloc(), child: HomePage()),
  FilterPage.route: (_) => BlocProvider(
    create: (context) => provideFilterBloc(),
    child: FilterPage(),
  ),
};

Route<dynamic>? generatedRoutes(RouteSettings settings) {
  final uri = Uri.parse(settings.name ?? '');

  switch (uri.path) {
    case FoodListPage.route:
      if (settings.arguments != null &&
          settings.arguments is FoodListArgument) {
        return _getFoodListPage(
          settings,
          settings.arguments! as FoodListArgument,
        );
      }
  }
  return null;
}

MaterialPageRoute _getFoodListPage(
  RouteSettings settings,
  FoodListArgument argument,
) {
  return MaterialPageRoute(
    builder: (context) => BlocProvider<FoodListBloc>(
      create: (context) => provideFoodListBloc(argument),
      child: const FoodListPage(),
    ),
    settings: settings,
  );
}
