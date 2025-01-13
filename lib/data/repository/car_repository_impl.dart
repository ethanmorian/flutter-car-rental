import 'package:flutter_car_rental/data/model/car.dart';
import 'package:flutter_car_rental/data/source/firebase_car_source.dart';
import 'package:flutter_car_rental/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
