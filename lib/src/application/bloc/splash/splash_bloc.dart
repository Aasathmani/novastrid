import 'package:bloc/bloc.dart';
import 'package:novastrid/src/application/bloc/splash/splash_event.dart';
import 'package:novastrid/src/application/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(navigationPage: NavigationPage.home));
    });
    add(SplashInit());
  }
}

enum NavigationPage { home, none }
