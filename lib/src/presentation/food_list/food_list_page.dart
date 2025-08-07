import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/generated/l10n.dart';
import 'package:novastrid/src/application/bloc/food_list/food_list_bloc.dart';
import 'package:novastrid/src/application/bloc/food_list/food_list_state.dart';
import 'package:novastrid/src/application/model/meal_model.dart';
import 'package:novastrid/src/presentation/food_description/food_description_page.dart';

class FoodListPage extends StatefulWidget {
  static const route = '/foodList';
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  FoodListBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc ??= BlocProvider.of<FoodListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_bloc!.title ?? '', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<FoodListBloc, FoodListState>(
        builder: (context, state) {
          final meals = state.meals;
          if (meals == null || meals.isEmpty) {
            return Center(
              child: Text(
                S.current.labelNoMealsFound,
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    FoodDescriptionPage.route,
                    arguments: FoodDescriptionArgument(mealId: meal.id),
                  );
                },
                child: _getFoodItem(context, meal),
              );
            },
          );
        },
      ),
    );
  }

  Widget _getFoodItem(BuildContext context, MealModel meal){
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                meal.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      _getTitle(context, meal),
                      _getRowDataLayout(context,meal),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTitle(BuildContext context, MealModel meal){
    return Text(
      meal.title,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      softWrap: true,
      overflow: TextOverflow.fade,
    );
  }

  Widget _getRowDataLayout(BuildContext context, MealModel meal){
    String formattedComplexity =
        meal.complexity[0].toUpperCase() +
            meal.complexity.substring(1);
    String formattedAffordability =
        meal.affordability[0].toUpperCase() +
            meal.affordability.substring(1);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                "${meal.duration} min",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.work,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                formattedComplexity,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                formattedAffordability,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
