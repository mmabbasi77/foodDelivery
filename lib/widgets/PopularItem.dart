import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/ServerData/DataFromServer.dart';
import 'package:food_delivery_app/pages/ItemPage.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:get/get.dart';

class PopularItem extends StatefulWidget {
  final String imageAddress;
  final String title;
  final String description;
  PopularItem({
    required this.imageAddress,
    required this.title,
    required this.description,
  });

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool heartCheker = true;
  FoodController foodController = Get.put(FoodController(
      foodsAddressItem: [].obs,
      foodName: [].obs,
      foodNumber: [].obs,
      foodTotal: 0.obs));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: size.height * 17 / 75,
        height: size.height * 22.5 / 75,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [CustomWidgets().commonBoxShadow]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height / 75),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  foodController.foodName.add(widget.imageAddress);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemPage(
                      title: widget.title,
                      imageAddress: widget.imageAddress,
                      completeDescription:
                          DataFromServer().descriptionData["burger"].toString(),
                    );
                  }));
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/${widget.imageAddress}.png",
                      height: size.height * 11 / 75,
                    ),
                  ),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 2 / 75),
              ),
              SizedBox(
                height: size.height * 0.4 / 75,
              ),
              Text(
                widget.description,
                style: TextStyle(fontSize: size.height / 75),
              ),
              SizedBox(
                height: size.height * 1.2 / 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$10",
                    style: TextStyle(
                        fontSize: size.height * 1.7 / 75,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
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
                              size: size.height * 2.5 / 75,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: size.height * 2.5 / 75,
                            )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
