class FilterEvent {}

class UpdateFilterEvent extends FilterEvent {
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  UpdateFilterEvent({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
