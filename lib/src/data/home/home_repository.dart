import 'package:novastrid/src/data/home/home_service.dart';

import '../../application/model/mock_data_model.dart';
import 'mock_data.dart';

class HomeRepository {
  static HomeRepository? instance;
  final HomeService homeService;
  HomeRepository({required this.homeService});

  Future<MockDataModel> getCategories() async {
    try {
      final response = MockDataModel.fromJson(MockData.mockData);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
