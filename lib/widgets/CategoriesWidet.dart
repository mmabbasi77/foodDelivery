import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/CategoryItem.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 1.5 / 75,
            vertical: size.height * 1.5 / 75),
        child: Row(
          children: [
            CategoryItem(imageAddress: "drink"),
            CategoryItem(imageAddress: "salan"),
            CategoryItem(imageAddress: "biryani"),
            CategoryItem(imageAddress: "burger"),
            CategoryItem(imageAddress: "pizza"),
            CategoryItem(imageAddress: "burger"),
          ],
        ),
      ),
    );
  }
}
