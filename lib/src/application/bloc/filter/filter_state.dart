class FilterState{
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  FilterState({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
});
  FilterState copyWith({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegan,
    bool? isVegetarian,
}){
    return FilterState(
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
    );
  }
}