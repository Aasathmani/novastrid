import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/splash/splash_bloc.dart';
import '../../application/bloc/splash/splash_state.dart';
import '../../core/app_constants.dart';
import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  static const route = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashBloc? _bloc;

  @override
  void didChangeDependencies() {
    _bloc ??= BlocProvider.of<SplashBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.navigationPage == NavigationPage.home) {
            Navigator.popAndPushNamed(context, HomePage.route);
          }
        },
        builder: (BuildContext context, SplashState state) {
          return ColoredBox(
            color: Colors.white,
            child: Center(child: Image.asset(AppIcons.kNovaLogo)),
          );
        },
      ),
    );
  }
}
