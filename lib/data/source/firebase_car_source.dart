import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_car_rental/data/model/car.dart';

class FirebaseCarSource {
  final FirebaseFirestore firestore;

  FirebaseCarSource({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
