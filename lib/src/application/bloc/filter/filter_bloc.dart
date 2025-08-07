import 'package:bloc/bloc.dart';
import 'package:novastrid/src/application/bloc/filter/filter_event.dart';
import 'package:novastrid/src/application/bloc/filter/filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<UpdateFilterEvent>((event, emit) {
      emit(
        state.copyWith(
          isGlutenFree: event.isGlutenFree,
          isLactoseFree: event.isLactoseFree,
          isVegan: event.isVegan,
          isVegetarian: event.isVegetarian,
        ),
      );
    });
  }
}
