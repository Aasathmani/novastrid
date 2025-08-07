import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novastrid/src/application/bloc/home/home_bloc.dart';
import 'package:novastrid/src/application/bloc/home/home_state.dart';
import 'package:novastrid/src/core/app_constants.dart';
import 'package:novastrid/src/presentation/food_list/food_list_page.dart';

import '../core/theme/base_state.dart';
import '../core/theme/colors.dart';
import '../filter/filter_page.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  HomeBloc? _bloc;
  String _selectedDrawerItem = 'meals';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc ??= BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text("Categories", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
          ),
          drawer: Drawer(
            backgroundColor: Colors.brown.shade900,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.brown],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: 36,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Cooking Up!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  selected: _selectedDrawerItem == 'meals',
                  selectedTileColor: Colors.brown.shade700,
                  leading: Icon(Icons.restaurant, color: Colors.white),
                  title: Text(
                    "Meals",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedDrawerItem = 'meals';
                    });
                    Navigator.of(context).pop(); // stay on current page
                  },
                ),
                ListTile(
                  selected: _selectedDrawerItem == 'filter',
                  selectedTileColor: Colors.brown.shade700,
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    "Filter",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedDrawerItem = 'filter';
                    });
                    Navigator.pushNamed(context, FilterPage.route);
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: state.mockData != null
                ? GridView.builder(
                    itemCount: state.mockData?.availableCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (ctx, index) {
                      final category =
                          state.mockData?.availableCategories[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            FoodListPage.route,
                            arguments: FoodListArgument(
                                title: category.title,
                                category: category.id),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                getColorFromString(category!.color),
                                Colors.black,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Units.kMPadding),
                            child: Text(
                              category.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
