import 'package:novastrid/src/data/home/home_repository.dart';
import 'package:novastrid/src/data/home/home_service.dart';

HomeRepository provideHomeRepository() {
  return HomeRepository.instance ?? HomeRepository(homeService: HomeService());
}
