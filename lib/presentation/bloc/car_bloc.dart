import 'package:bloc/bloc.dart';
import 'package:flutter_car_rental/domain/usecase/get_cars.dart';
import 'package:flutter_car_rental/presentation/bloc/car_event.dart';
import 'package:flutter_car_rental/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
