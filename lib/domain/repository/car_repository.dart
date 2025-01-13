import 'package:flutter_car_rental/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
