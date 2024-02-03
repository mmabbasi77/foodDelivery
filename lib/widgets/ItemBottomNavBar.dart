import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/FunctionsAndMethods/Summation.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:get/get.dart';

class ItemBottomNavBar extends StatelessWidget {
  ItemBottomNavBar({super.key});

  FoodController foodController = Get.put(FoodController(
      foodsAddressItem: [].obs,
      foodName: [].obs,
      foodNumber: [].obs,
      foodTotal: 0.obs));

  bool existance = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.height * 2 / 75),
        height: size.height * 7 / 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: size.height * 1.9 / 75,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.height * 1.5 / 75,
                ),
                Text(
                  "\$10",
                  style: TextStyle(
                      fontSize: size.height * 1.9 / 75,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                for (int i = 0;
                    i < foodController.foodsAddressItem.length;
                    i++) {
                  if (foodController.foodsAddressItem[i] ==
                      foodController.foodName.last) {
                    existance = true;

                    i = 0;

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item alredy added!")));
                    break;
                  } else {
                    existance = false;
                  }
                }
                if (existance == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Item added succesfully!")));
                  foodController.foodsAddressItem
                      .add(foodController.foodName.last);
                  foodController.foodNumber.add(1.obs);
                  foodController.foodTotal.value =
                      Summations().summation(foodController.foodNumber);
                }
              },
              style: CustomWidgets().commonButtonStyle,
              label: Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 1.6 / 75,
                    fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
