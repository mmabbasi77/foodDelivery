import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/FunctionsAndMethods/Summation.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:food_delivery_app/FoodData/FoodData.dart';
import 'package:get/get.dart';

class OrderItemWidget extends StatelessWidget {
  final String imageAddress;
  final String foodName;
  RxInt foodNumber;

  OrderItemWidget({
    required this.imageAddress,
    required this.foodName,
    required this.foodNumber,
  });

  FoodController foodController = Get.put(FoodController(
      foodsAddressItem: [].obs,
      foodName: [].obs,
      foodNumber: [].obs,
      foodTotal: 0.obs));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.9 / 75),
      child: Container(
        width: size.height * 38 / 75,
        height: size.height * 10 / 75,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [CustomWidgets().commonBoxShadow]),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/$imageAddress.png",
                height: size.height * 8 / 75,
                width: size.height * 13 / 75,
              ),
            ),
            Container(
              width: size.height * 19 / 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    FoodData().foodData[imageAddress]![0],
                    style: TextStyle(
                        fontSize: size.height * 1.5 / 75,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    FoodData().foodData[imageAddress]![1],
                    style: TextStyle(
                      fontSize: size.height * 1 / 75,
                    ),
                  ),
                  Text(
                    "\$10",
                    style: TextStyle(
                        fontSize: size.height * 2 / 75,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height / 75),
              child: Container(
                padding: EdgeInsets.all(size.height * 0.5 / 75),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        foodNumber.value++;
                        foodController.foodTotal.value =
                            Summations().summation(foodController.foodNumber);
                      },
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                        size: size.height * 1.2 / 75,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        foodNumber.value.toString(),
                        style: TextStyle(
                            fontSize: size.height * 1.4 / 75,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        if (foodNumber.value > 0) {
                          foodNumber.value--;
                          foodController.foodTotal.value =
                              Summations().summation(foodController.foodNumber);
                        } else {
                          foodNumber.value = 0;
                        }
                      },
                      child: Icon(
                        CupertinoIcons.minus,
                        color: Colors.white,
                        size: size.height * 1.2 / 75,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
