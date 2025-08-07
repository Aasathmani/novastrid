import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/src/application/bloc/filter/filter_bloc.dart';

class FilterPage extends StatefulWidget {
  static const String route = '/filter';
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc ??= BlocProvider.of<FilterBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
