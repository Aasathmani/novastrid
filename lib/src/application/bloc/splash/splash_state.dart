import 'package:novastrid/src/application/bloc/splash/splash_bloc.dart';

class SplashState {
  NavigationPage navigationPage;

  SplashState({this.navigationPage = NavigationPage.none});
  SplashState copyWith({NavigationPage? navigationPage}) {
    return SplashState(navigationPage: navigationPage ?? this.navigationPage);
  }
}
