import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';

class CategoryItem extends StatelessWidget {
  final String imageAddress;
  CategoryItem({required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 1.5 / 75),
      child: Container(
        padding: EdgeInsets.all(size.height * 0.8 / 75),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [CustomWidgets().commonBoxShadow]),
        child: Image.asset(
          "assets/images/$imageAddress.png",
          width: size.height * 5 / 75,
          height: size.height * 5 / 75,
        ),
      ),
    );
  }
}
