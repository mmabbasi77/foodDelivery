import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/widgets/AppBarWidget.dart';
import 'package:food_delivery_app/widgets/CartBottomNavBar.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:food_delivery_app/widgets/DrawerWidget.dart';
import 'package:food_delivery_app/widgets/OrderItemWidget.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  FoodController foodController = Get.put(FoodController(
      foodsAddressItem: [].obs,
      foodName: [].obs,
      foodNumber: [].obs,
      foodTotal: 0.obs));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height / 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
                child: Text(
                  "OrderList",
                  style: TextStyle(
                      fontSize: size.height / 25, fontWeight: FontWeight.bold),
                ),
              ),
              (foodController.foodsAddressItem.isNotEmpty)
                  ? SizedBox(
                      height: size.height /
                          5.35 *
                          foodController.foodsAddressItem.length,
                      width: double.infinity,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: foodController.foodsAddressItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderItemWidget(
                              imageAddress:
                                  foodController.foodsAddressItem[index],
                              foodNumber: foodController.foodNumber[index],
                              foodName: foodController.foodName[index],
                            );
                          },
                        );
                      }),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.height * 2 / 75,
                    vertical: size.height * 3 / 75),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [CustomWidgets().commonBoxShadow]),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Items:",
                              style: TextStyle(
                                fontSize: size.height * 2 / 75,
                              ),
                            ),
                            Text(
                              foodController.foodsAddressItem.length.toString(),
                              style: TextStyle(
                                fontSize: size.height * 2 / 75,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub-Total:",
                              style: TextStyle(
                                fontSize: size.height * 2 / 75,
                              ),
                            ),
                            Obx((() {
                              return Text(
                                (foodController.foodTotal * 10).toString(),
                                style: TextStyle(
                                  fontSize: size.height * 2 / 75,
                                ),
                              );
                            })),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery:",
                              style: TextStyle(
                                fontSize: size.height * 2 / 75,
                              ),
                            ),
                            (foodController.foodsAddressItem.isNotEmpty)
                                ? Text(
                                    "\$20",
                                    style: TextStyle(
                                      fontSize: size.height * 2 / 75,
                                    ),
                                  )
                                : const Text("0"),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(
                                  fontSize: size.height * 2 / 75,
                                  fontWeight: FontWeight.bold),
                            ),
                            Obx(() {
                              return Text(
                                (foodController.foodTotal * 10 + 20).toString(),
                                style: TextStyle(
                                    fontSize: size.height * 2 / 75,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
