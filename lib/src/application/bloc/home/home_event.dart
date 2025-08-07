class HomeEvent {}

class HomeInit extends HomeEvent {}

class SelectDrawerItemEvent extends HomeEvent {
  String item;
  SelectDrawerItemEvent(this.item);
}

class ChangeBottomBar extends HomeEvent {
  int index;
  ChangeBottomBar(this.index);
}
