import '../../model/mock_data_model.dart';

class HomeState {
  MockDataModel? mockData;
  HomeState({
    this.mockData,
});
  HomeState copyWith({
     MockDataModel? mockData,
}){
    return HomeState(
      mockData: mockData ?? this.mockData,
    );
  }
}