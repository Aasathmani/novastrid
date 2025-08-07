class FoodDescriptionEvent{}

class FoodDescriptionInit extends FoodDescriptionEvent{}

class FavoriteMealEvent extends FoodDescriptionEvent{
  String mealId;
  FavoriteMealEvent(this.mealId);
}