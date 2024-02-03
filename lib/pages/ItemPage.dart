import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/widgets/AppBarWidget.dart';
import 'package:food_delivery_app/widgets/DrawerWidget.dart';
import 'package:food_delivery_app/widgets/ItemBottomNavBar.dart';

class ItemPage extends StatelessWidget {
  final String title;
  final String imageAddress;
  final String completeDescription;
  ItemPage(
      {required this.title,
      required this.imageAddress,
      required this.completeDescription});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.5 / 75),
        child: ListView(
          children: [
            const AppBarWidget(),
            Padding(
              padding: EdgeInsets.all(size.height * 1.6 / 75),
              child: Image.asset(
                "assets/images/$imageAddress.png",
                height: size.height * 30 / 75,
                width: double.infinity,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: size.height * 3 / 75,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 2 / 75),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 6 / 75,
                            bottom: size.height * 2 / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: size.height * 1.8 / 75,
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
                                  fontSize: size.height * 2 / 75,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height / 75,
                            bottom: size.height * 2 / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: size.height * 2.8 / 75,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 75),
                        child: Text(
                          completeDescription,
                          style: TextStyle(
                            fontSize: size.height * 1.6 / 75,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 1.5 / 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time: ",
                              style: TextStyle(
                                  fontSize: size.height * 1.6 / 75,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.height * 0.5 / 75),
                                  child: const Icon(CupertinoIcons.clock),
                                ),
                                Text(
                                  "30 Minutes",
                                  style: TextStyle(
                                      fontSize: size.height * 1.6 / 75,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}
