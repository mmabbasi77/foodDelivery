import 'package:get/get.dart';

class FoodController extends GetxController {
  RxList foodsAddressItem;
  RxList foodName;
  RxList foodNumber;
  RxInt foodTotal;
  FoodController(
      {required this.foodsAddressItem,
      required this.foodName,
      required this.foodNumber,
      required this.foodTotal});
}
