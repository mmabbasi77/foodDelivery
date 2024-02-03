import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/controller.dart';
import 'package:food_delivery_app/FoodData/FoodData.dart';
import 'package:food_delivery_app/SearchFoods/SearchFoods.dart';
import 'package:food_delivery_app/ServerData/DataFromServer.dart';
import 'package:food_delivery_app/pages/CartPage.dart';
import 'package:food_delivery_app/pages/ItemPage.dart';
import 'package:food_delivery_app/widgets/AppBarWidget.dart';
import 'package:food_delivery_app/widgets/CategoriesWidet.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';
import 'package:food_delivery_app/widgets/DrawerWidget.dart';
import 'package:food_delivery_app/widgets/NewestItemsWidget.dart';
import 'package:food_delivery_app/widgets/PopularItemsWidget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> searchedFood = [];

  Map<String, List> foodData = FoodData().foodData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // custom app-bar
            const AppBarWidget(),
            // search
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 1.5 / 75,
                  horizontal: size.height * 1.5 / 75),
              child: Container(
                width: double.infinity,
                height: size.height * 5 / 75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      CustomWidgets().commonBoxShadow,
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.search,
                        color: Colors.red,
                      ),
                      Container(
                        height: size.height * 5 / 75,
                        width: size.height * 30 / 75,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            onChanged: (value) {
                              searchedFood = SearchingFood().searchFood(value);
                            },
                            onFieldSubmitted: (value) {
                              if (searchedFood.isNotEmpty) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ItemPage(
                                    title: foodData[searchedFood[0]]![0],
                                    imageAddress: searchedFood[0],
                                    completeDescription: DataFromServer()
                                        .descriptionData["burger"]
                                        .toString(),
                                  );
                                }));
                              }
                            },
                            decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(fontSize: size.height / 75),
                                hintText: "What would you like to have?",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 2 / 75, left: size.height / 75),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 2 / 75,
                ),
              ),
            ),
            // Category Widget
            const CategoriesWidget(),

            // Popular Items
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 2 / 75, left: size.height / 75),
              child: Text(
                "Popular",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 2 / 75,
                ),
              ),
            ),
            // Popular Items Widget
            const PopularItmesWidget(),
            // Newest Item
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 2 / 75, left: size.height / 75),
              child: Text(
                "Newer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 2 / 75,
                ),
              ),
            ),
            // Newest Itmes Widget
            const NewestItemsWidget(),
          ],
        ),
        drawer: const DrawerWidget(),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3))
              ]),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return CartPage();
              })));
            },
            backgroundColor: Colors.white,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.red,
              size: size.height * 2.8 / 75,
            ),
          ),
        ),
      ),
    );
  }
}
