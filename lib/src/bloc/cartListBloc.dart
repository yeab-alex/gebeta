import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:food_delivery/bloc/provider.dart';
// import 'package:food_delivery/model/food_item.dart';
import 'package:project/src/bloc/provider.dart';
import 'package:project/src/models/food_model.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<Food>>.seeded([]);

//provider class
  CartProvider provider = CartProvider();

//output
  Stream<List<Food>> get listStream => _listController.stream;

//input
  Sink<List<Food>> get listSink => _listController.sink;

  addToList(Food foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(Food foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
