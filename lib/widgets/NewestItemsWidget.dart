import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/NewItem.dart';

class NewestItemsWidget extends StatelessWidget {
  const NewestItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height / 75, horizontal: size.height / 75),
        child: Column(
          children: [
            NewItem(
              imageAddress: "pizza",
              title: "Hot Pizza",
              description: "Taste Our Hot Pizza, We Provide Our Great Foods",
            ),
            NewItem(
              imageAddress: "burger",
              title: "Hot Burger",
              description: "Taste Our Hot Burger, We Provide Our Great Foods",
            ),
          ],
        ),
      ),
    );
  }
}
