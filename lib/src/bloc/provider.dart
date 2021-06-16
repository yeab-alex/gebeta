// import 'package:food_delivery/model/food_item.dart';
import 'package:project/src/models/food_model.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<Food> foodItems = [];

  List<Food> addToList(Food foodItem) {
    bool isPresent = false;

    if (foodItems.length > 0) {
      for (int i = 0; i < foodItems.length; i++) {
        if (foodItems[i].id == foodItem.id) {
          increaseItemQuantity(foodItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        foodItems.add(foodItem);
      }
    } else {
      foodItems.add(foodItem);
    }

    return foodItems;
  }

  List<Food> removeFromList(Food foodItem) {
    if (foodItem.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantity(foodItem);
    } else {
      //remove it from the list
      foodItems.remove(foodItem);
    }
    return foodItems;
  }

  void increaseItemQuantity(Food foodItem) => foodItem.incrementQuantity();
  void decreaseItemQuantity(Food foodItem) => foodItem.decrementQuantity();
}
