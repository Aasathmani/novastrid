import 'package:novastrid/src/core/app_constants.dart';

import '../../model/mock_data_model.dart';

class HomeState {
  MockDataModel? mockData;
  String selectDrawerItem;
  HomeState({this.mockData, this.selectDrawerItem = DrawerItem.meals});
  HomeState copyWith({MockDataModel? mockData, String? selectDrawerItem}) {
    return HomeState(
      mockData: mockData ?? this.mockData,
      selectDrawerItem: selectDrawerItem ?? this.selectDrawerItem,
    );
  }
}
