import 'package:bloc/bloc.dart';
import 'package:novastrid/src/data/home/home_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeState()) {
    on<HomeInit>((event, emit) async {
      await _onInit(event, emit);
    });
    add(HomeInit());
  }

  Future<void> _onInit(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      final mockData = await homeRepository.getCategories();
      emit(state.copyWith(mockData: mockData));
    } catch (e) {}
  }
}

class FoodListArgument {
  String? title;
  String? category;
  FoodListArgument({this.category, this.title});
}
