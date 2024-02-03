import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/FunctionsAndMethods/Summation.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:get/get.dart';

class NewItem extends StatefulWidget {
  final String imageAddress;
  final String title;
  final String description;
  NewItem(
      {required this.imageAddress,
      required this.title,
      required this.description});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  bool heartCheker = true;
  bool existance = false;

  FoodController foodController = Get.put(FoodController(
      foodsAddressItem: [].obs,
      foodName: [].obs,
      foodNumber: [].obs,
      foodTotal: 0.obs));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height / 75),
      child: Container(
        width: size.height * 38 / 75,
        height: size.height * 15 / 75,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [CustomWidgets().commonBoxShadow]),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/${widget.imageAddress}.png",
                  height: size.height * 12 / 75,
                  width: size.height * 15 / 75,
                ),
              ),
              // child: ,
            ),
            Container(
              width: size.height * 17 / 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: size.height * 2 / 75,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: size.height * 1.2 / 75,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: size.height * 1.5 / 75,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.4 / 75),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (index) {},
                  ),
                  Text(
                    "\$10",
                    style: TextStyle(
                        fontSize: size.height * 1.8 / 75,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height / 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (heartCheker) {
                          setState(() {
                            heartCheker = false;
                          });
                        } else {
                          setState(() {
                            heartCheker = true;
                          });
                        }
                      },
                      child: (heartCheker)
                          ? Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: size.height * 2.1 / 75,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: size.height * 2.1 / 75,
                            )),
                  GestureDetector(
                      onTap: () {
                        foodController.foodName.add(widget.imageAddress);
                        for (int i = 0;
                            i < foodController.foodsAddressItem.length;
                            i++) {
                          if (foodController.foodsAddressItem[i] ==
                              foodController.foodName.last) {
                            existance = true;

                            i = 0;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Item alredy added!")));
                            break;
                          } else {
                            existance = false;
                          }
                        }
                        if (existance == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Item added succesfully!")));
                          foodController.foodsAddressItem
                              .add(foodController.foodName.last);
                          foodController.foodNumber.add(1.obs);
                          foodController.foodTotal.value =
                              Summations().summation(foodController.foodNumber);
                        }
                      },
                      child: Icon(CupertinoIcons.cart,
                          color: Colors.red, size: size.height * 2.1 / 75)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
