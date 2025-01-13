import 'package:flutter_car_rental/data/model/car.dart';
import 'package:flutter_car_rental/domain/repository/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
