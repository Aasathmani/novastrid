import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/generated/l10n.dart';
import 'package:novastrid/src/application/bloc/filter/filter_bloc.dart';
import 'package:novastrid/src/application/bloc/filter/filter_state.dart';
import 'package:novastrid/src/application/bloc/filter/filter_event.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(S.current.labelYourFilter, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return ListView(
            children: [
              _buildSwitchTile(
                title: S.current.labelGlutenFree,
                subtitle: S.current.labelOnlyIncludeGlutenFreeMeals,
                value: state.isGlutenFree,
                onChanged: (val) {
                  _bloc!.add(UpdateFilterEvent(isGlutenFree: val));
                },
              ),
              _buildSwitchTile(
                title: S.current.labelLactoseFree,
                subtitle: S.current.labelOnlyIncludeLactoseFreeMeals,
                value: state.isLactoseFree,
                onChanged: (val) {
                  _bloc!.add(UpdateFilterEvent(isLactoseFree: val));
                },
              ),
              _buildSwitchTile(
                title: S.current.labelVegFree,
                subtitle: S.current.labelOnlyIncludeVeganMeals,
                value: state.isVegetarian,
                onChanged: (val) {
                  _bloc!.add(UpdateFilterEvent(isVegetarian: val));
                },
              ),
              _buildSwitchTile(
                title: S.current.labelVeganFree,
                subtitle: S.current.labelOnlyIncludeVegetarianMeals,
                value: state.isVegan,
                onChanged: (val) {
                  _bloc!.add(UpdateFilterEvent(isVegan: val));
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.deepOrange,
    );
  }
}
