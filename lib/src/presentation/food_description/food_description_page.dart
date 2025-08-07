import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/generated/l10n.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_bloc.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_event.dart';
import 'package:novastrid/src/application/bloc/food_description/food_description_state.dart';
import 'package:novastrid/src/application/model/meal_model.dart';

class FoodDescriptionPage extends StatefulWidget {
  static const String route = '/foodDescription';
  const FoodDescriptionPage({super.key});

  @override
  State<FoodDescriptionPage> createState() => _FoodDescriptionPageState();
}

class _FoodDescriptionPageState extends State<FoodDescriptionPage> {
  FoodDescriptionBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc ??= BlocProvider.of<FoodDescriptionBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodDescriptionBloc, FoodDescriptionState>(
      listener: (context,state) {
        if (state.toastMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.toastMessage!),
            ),
          );
        }
      },
      builder: (context, state) {
        final meal = state.meal;

        if (meal == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              state.meal!.title ?? '',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                onPressed: () {
                  _bloc!.add(FavoriteMealEvent(state.meal?.id ?? ''));
                },
                icon: Icon(state.isFavorite ? Icons.star : Icons.star_border,color: Colors.orangeAccent,),
                color: Colors.white,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getImageView(context, meal),
                const SizedBox(height: 16),
                const SizedBox(height: 10),
                Text(
                  S.current.labelIngredients,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(height: 8),
                ...meal.ingredients.map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      ingredient,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Steps',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ...meal.steps.asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    child: Text(
                      entry.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getImageView(BuildContext context, MealModel meal){
    return  Image.network(
      meal.imageUrl,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
