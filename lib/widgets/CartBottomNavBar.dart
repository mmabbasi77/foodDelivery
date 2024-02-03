import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/CustomWidgets.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

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
                  "\$80",
                  style: TextStyle(
                      fontSize: size.height * 1.9 / 75,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: CustomWidgets().commonButtonStyle,
              child: Text(
                "Order Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 1.6 / 75,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
