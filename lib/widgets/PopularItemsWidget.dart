import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/PopularItem.dart';

class PopularItmesWidget extends StatelessWidget {
  const PopularItmesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.5 / 75,
            vertical: size.height * 1.5 / 75),
        child: Row(
          children: [
            PopularItem(
              imageAddress: "burger",
              title: "Hot Burger",
              description: "Taste Our Hot Burger",
            ),
            PopularItem(
              imageAddress: "salan",
              title: "Hot Salan",
              description: "Taste Our Hot Salan",
            ),
            PopularItem(
              imageAddress: "drink",
              title: "Cold Drink",
              description: "Taste Our Cold Drink",
            ),
            PopularItem(
              imageAddress: "pizza",
              title: "Hot Pizza",
              description: "Taste Our Hot Pizza",
            ),
            PopularItem(
              imageAddress: "biryani",
              title: "Hot Biryani",
              description: "Taste Our Hot Biryani",
            ),
          ],
        ),
      ),
    );
  }
}
