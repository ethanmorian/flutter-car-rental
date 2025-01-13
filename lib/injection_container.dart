import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_car_rental/data/repository/car_repository_impl.dart';
import 'package:flutter_car_rental/data/source/firebase_car_source.dart';
import 'package:flutter_car_rental/domain/repository/car_repository.dart';
import 'package:flutter_car_rental/domain/usecase/get_cars.dart';
import 'package:flutter_car_rental/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseCarSource>(
      () => FirebaseCarSource(firestore: getIt<FirebaseFirestore>()),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(getIt<FirebaseCarSource>()),
    );
    getIt.registerLazySingleton<GetCars>(
      () => GetCars(getIt<CarRepository>()),
    );
    getIt.registerFactory(
      () => CarBloc(getCars: getIt<GetCars>()),
    );
  } catch (e) {
    throw e;
  }
}
