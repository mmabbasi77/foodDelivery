import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/CartPage.dart';
import 'package:food_delivery_app/pages/HomePage.dart';
import 'package:food_delivery_app/widgets/CustomListTile.dart';
// import 'package:flutter/services.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.red),
              accountName: Text(
                "Mahdi Abbasi",
                style: TextStyle(
                    fontSize: size.height * 1.5 / 75,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("mmabbasi1377@gmail.com",
                  style: TextStyle(
                    fontSize: size.height * 1.3 / 75,
                  )),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/avatar.jpg",
                ),
              ),
              currentAccountPictureSize: Size.square(size.height * 6 / 75),
            ),
          ),
          // ListTile!
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: CustomListTile(
              title: "Home",
              icon: CupertinoIcons.home,
            ),
          ),
          CustomListTile(
            title: "My Account",
            icon: CupertinoIcons.person,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartPage();
              }));
            },
            child: CustomListTile(
              title: "My Orders",
              icon: CupertinoIcons.cart_fill,
            ),
          ),
          CustomListTile(
            title: "My Wish List",
            icon: CupertinoIcons.heart_fill,
          ),
          CustomListTile(
            title: "Settings",
            icon: CupertinoIcons.settings,
          ),
          GestureDetector(
            onTap: () {
              // SystemNavigator.pop();
            },
            child: CustomListTile(
              title: "Exit",
              icon: Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}
